
import 'package:praxis/models/app_state.dart';
import 'package:praxis/reducers/covers_reducer.dart';
import 'package:praxis/reducers/users_reducer.dart';
import 'load_reducer.dart';
import 'connectivity_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    connectivity: connectivityReducer(state.connectivity,action),
    load: loadReducer(state.load,action),
    users: usersReducer(state.users, action),
    covers: coversReducer(state.covers,action)
  );
}
