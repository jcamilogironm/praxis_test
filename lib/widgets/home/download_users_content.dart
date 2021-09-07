import 'package:flutter/material.dart';
import 'package:praxis/containers/data.dart';
import 'package:praxis/containers/loading.dart';
import 'package:praxis/containers/download_users.dart';
import 'package:praxis/models/load.dart';
import 'package:praxis/widgets/shared/loading_indicator.dart';

class DownloadUsersContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Data(builder: (context, vm) {
      return DownloadUsers(builder: (context, downloadUsers) {
        return Loading(builder: (context, load) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              load!.isLoading && load.action == LoadAction.getUsers
                  ? LoadingIndicator()
                  : Text(vm.users.isEmpty
                          ? "No tienes usuarios almacenados"
                          : "Usuarios descargados correctamente",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  onPressed: () => load.isLoading ? () {} : downloadUsers(context),
                  child: Text("Descargar"))
            ],
          );
        });
      });
    });
  }
}
