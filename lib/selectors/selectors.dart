import 'package:connectivity/connectivity.dart';
import 'package:praxis/models/app_state.dart';
import 'package:praxis/models/models.dart';
import 'package:redux/redux.dart';

Load? stoLoad(Store<AppState> store) => store.state.load;
ConnectivityResult? stoConnectivity(Store<AppState> store) => store.state.connectivity;
List<User> stoUsers(Store<AppState> store) => store.state.users;
List<Cover> stoCovers(Store<AppState> store) => store.state.covers;