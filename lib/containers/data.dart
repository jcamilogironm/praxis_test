import 'package:flutter_redux/flutter_redux.dart';
import 'package:praxis/models/app_state.dart';
import 'package:praxis/models/models.dart';
import 'package:praxis/selectors/selectors.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  final Widget Function(BuildContext context, _ViewModel vm) builder;

  Data({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: builder,
    );
  }
}

class _ViewModel {
  final List<Cover> covers;
  final List<User> users;

  _ViewModel({required this.covers, required this.users});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      covers: stoCovers(store),
      users: stoUsers(store)
    );
  }
}
