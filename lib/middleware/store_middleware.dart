import 'dart:convert';
import 'package:praxis/actions/actions.dart';
import 'package:praxis/models/app_state.dart';
import 'package:praxis/models/models.dart';
import 'package:praxis/providers/app_service_provider.dart';
import 'package:praxis/utils/api.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;

List<Middleware<AppState>> createStoreMiddleware() {
  final loadGalleryAction = _loadGalleryAction();
  final loadUsersAction = _loadUsersAction();

  return [
    TypedMiddleware<AppState, LaunchAction>(loadGalleryAction),
    TypedMiddleware<AppState, LoadUsersAction>(loadUsersAction),
  ];
}

Middleware<AppState> _loadGalleryAction() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (await AppServiceProvider().connected(store, action.context)) {
      http.Response response = await getGallery();
      if (AppServiceProvider().successfulResponse(response, action.context)) {
        List<Cover> covers = (json.decode(response.body) as List).map((data) => Cover.fromJson(data)).toList();
        store.dispatch(CoversLoadedAction(covers));

        /*for (Cover cover in gallery) {
          await DefaultCacheManager().downloadFile(cover.url!);
        }*/
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
        store.dispatch(UsersLoadedAction((json.decode(response.body) as List).map((data) => User.fromJson(data)).toList()));
      }
      store.dispatch(LoadedAction());
    }
    next(action);
  };
}
