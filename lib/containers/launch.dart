import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:praxis/actions/actions.dart';
import 'package:praxis/models/app_state.dart';
import 'package:praxis/screens/launch_screen.dart';
import 'package:redux/redux.dart';
class Launch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, void Function(BuildContext context)>(
      converter: (Store<AppState> store) {
      return (context){ 
        store.dispatch(LaunchAction(context));
      };
    }, builder: (BuildContext context, void Function(BuildContext context) getData) {
      return LaunchScreen(getData: getData);
    });
  }
}