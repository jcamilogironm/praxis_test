import 'package:praxis/actions/actions.dart';
import 'package:praxis/models/cover.dart';
import 'package:redux/redux.dart';

final coversReducer = combineReducers<List<Cover>>([
  TypedReducer<List<Cover>, CoversLoadedAction>(_setGallery),
]);

List<Cover> _setGallery(List<Cover> gallery, CoversLoadedAction action) {
  return action.gallery;
}