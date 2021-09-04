import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:praxis/actions/actions.dart';
import 'package:praxis/models/app_state.dart';
import 'package:praxis/selectors/selectors.dart';
import 'package:praxis/widgets/shared/alert_dialog_info.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppServiceProvider{

  static final AppServiceProvider _instance = AppServiceProvider._internal();

  factory AppServiceProvider() => _instance;

  static String message = "";

  AppServiceProvider._internal();
  

  Future<bool> connected(Store<AppState> store, BuildContext context) async {

    store.dispatch(CheckConnectivityAction(await Connectivity().checkConnectivity()));

    if (!(stoConnectivity(store) == ConnectivityResult.mobile || stoConnectivity(store)== ConnectivityResult.wifi)) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialogInfo(message: "La conexión de red falló, verifique que su dispositivo esté conectado a la red");
      });
    }

    return stoConnectivity(store) == ConnectivityResult.mobile || stoConnectivity(store)== ConnectivityResult.wifi;
  }
  

  bool successfulResponse(http.Response response, BuildContext context, {bool openDialog = true}) {
    message = "";
    if (response.statusCode == 401 && openDialog) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialogInfo(
                message: json.decode(response.body)['message']);
          });
    } else if (response.statusCode == 422) {
      var body = json.decode(response.body);

      for (var entry in body['errors'].entries) {
        for (var value in entry.value) {
          message += "$value \n";
        }
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialogInfo(message: message);
          });
    } else if (response.statusCode > 422) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialogInfo(message: "¡¡Upps !! Ocurrió un error en el servidor, consulte con el administrador");
          });
    }

    return response.statusCode == 200;
  }
}