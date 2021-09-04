import 'package:connectivity/connectivity.dart';
import 'models.dart';
import 'load.dart';

class AppState {
  final Load? load;
  final List<Cover> covers;
  final List<User> users;
  final ConnectivityResult? connectivity;

  factory AppState.loading() => AppState(load: Load(isLoading: true, action: LoadAction.launch));

  AppState({
    this.load,
    this.connectivity,
    this.users = const [],
    this.covers = const [],
  });
}
