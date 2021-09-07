import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:praxis/models/models.dart';

class CheckConnectivityAction {
  final ConnectivityResult connectivity;

  CheckConnectivityAction(this.connectivity);

  @override
  String toString() {
    return 'CheckConnectivityAction{connectivity: $connectivity}';
  }
}

class LoadingAction {
  final LoadAction action;

  LoadingAction(this.action);

  @override
  String toString() {
    return 'LoadingAction{action: $action}';
  }
}

class CoversLoadedAction {
  final List<Cover> gallery;

  CoversLoadedAction(this.gallery);

  @override
  String toString() {
    return 'CoversLoadedAction{action: $gallery}';
  }
}

class UsersLoadedAction {
  final List<User> users;

  UsersLoadedAction(this.users);

  @override
  String toString() {
    return 'UsersLoadedAction{action: $users}';
  }
}

class LoadedAction{}
class LaunchAction {
  
  final BuildContext context;

  LaunchAction(this.context);

}

class LoadUsersAction {
  final BuildContext context;

  LoadUsersAction(this.context);
}

class LoadUsersDatabaseAction {
  final BuildContext context;

  LoadUsersDatabaseAction(this.context);
}