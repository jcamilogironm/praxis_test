import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:praxis/containers/launch.dart';
import 'package:praxis/reducers/app_state_reducer.dart';
import 'package:redux/redux.dart';
import 'models/app_state.dart';
import 'middleware/store_middleware.dart';

void main() {
  runApp(PraxisApp());
}

class PraxisApp extends StatelessWidget {

  final store = Store<AppState>(appReducer,initialState: AppState.loading(), middleware: createStoreMiddleware());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
      title: 'Praxis',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Launch(),
    ));
  }
}