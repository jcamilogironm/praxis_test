
import 'package:praxis/actions/actions.dart';
import 'package:praxis/models/models.dart';
import 'package:redux/redux.dart';

final usersReducer = combineReducers<List<User>>([
  TypedReducer<List<User>, UsersLoadedAction>(_setUsers),
]);

List<User> _setUsers(List<User> users, UsersLoadedAction action) {
  return action.users;
}