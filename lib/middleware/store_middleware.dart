import 'dart:convert';
import 'package:praxis/actions/actions.dart';
import 'package:praxis/controller/database_manager.dart';
import 'package:praxis/models/app_state.dart';
import 'package:praxis/models/models.dart';
import 'package:praxis/providers/app_service_provider.dart';
import 'package:praxis/utils/api.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;

List<Middleware<AppState>> createStoreMiddleware() {
  final loadGalleryAction = _loadGalleryAction();
  final loadUsersAction = _loadUsersAction();
  final loadUsersDatabaseAction = _loadUsersDatabaseAction();

  return [
    TypedMiddleware<AppState, LaunchAction>(loadGalleryAction),
    TypedMiddleware<AppState, LoadUsersAction>(loadUsersAction),
    TypedMiddleware<AppState, LoadUsersDatabaseAction>(loadUsersDatabaseAction),
  ];
}

Middleware<AppState> _loadGalleryAction() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (await AppServiceProvider().connected(store, action.context)) {
      http.Response response = await getGallery();
      if (AppServiceProvider().successfulResponse(response, action.context)) {
        List<Cover> covers = (json.decode(response.body) as List).map((data) => Cover.fromJson(data)).toList();
        store.dispatch(CoversLoadedAction(covers));
      }
      store.dispatch(LoadedAction());
    }
    next(action);
  };
}

Middleware<AppState> _loadUsersAction(){
  return(Store<AppState> store, action, NextDispatcher next) async{
    if (await AppServiceProvider().connected(store, action.context)) {
      store.dispatch(LoadingAction(LoadAction.getUsers));
      http.Response response = await getUsers();
      if (AppServiceProvider().successfulResponse(response, action.context)) {

        List<User> users = (json.decode(response.body) as List).map((data) => User.fromJson(data)).toList();
        store.dispatch(UsersLoadedAction(users));
        DatabaseManager.db.delete(DatabaseManager.USERS);
        DatabaseManager.db.inserts(DatabaseManager.USERS, users);
      }
      store.dispatch(LoadedAction());
    }
    next(action);
  };
}

Middleware<AppState> _loadUsersDatabaseAction(){
  return(Store<AppState> store, action, NextDispatcher next) async{
    DatabaseManager.db.getUsers().then((users){
      store.dispatch(UsersLoadedAction(users));
    });
    next(action);
  };
}
