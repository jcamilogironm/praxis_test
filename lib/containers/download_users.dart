import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:praxis/actions/actions.dart';
import 'package:praxis/models/app_state.dart';
import 'package:redux/redux.dart';

class DownloadUsers extends StatelessWidget{

  final Widget Function(BuildContext context, void Function(BuildContext) downloadUsers) builder;

  DownloadUsers({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, void Function(BuildContext)>(
      converter: (Store<AppState> store) {
        return (context){
          store.dispatch(LoadUsersAction(context));
        };
      },
      builder: builder
    );
  }
}