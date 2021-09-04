import 'package:connectivity/connectivity.dart';
import 'package:redux/redux.dart';
import 'package:praxis/actions/actions.dart';

final connectivityReducer = combineReducers<ConnectivityResult?>([
  TypedReducer<ConnectivityResult?, CheckConnectivityAction>(_setStatus),
]);

ConnectivityResult _setStatus(ConnectivityResult? state, CheckConnectivityAction action) {
  return action.connectivity;
}