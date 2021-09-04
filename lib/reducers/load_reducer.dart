import 'package:praxis/models/models.dart';
import 'package:redux/redux.dart';
import 'package:praxis/actions/actions.dart';
final loadReducer = combineReducers<Load?>([
  TypedReducer<Load?, LoadedAction>(_setLoaded),
  TypedReducer<Load?, LoadingAction>(_setLoading),
]);

Load _setLoading(Load? state, LoadingAction loadAction) {
  return Load(isLoading: true, action: loadAction.action);
}

Load _setLoaded(Load? state, LoadedAction action) {
  return Load(isLoading: false, action: LoadAction.none);
}