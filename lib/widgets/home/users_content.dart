import 'package:flutter/material.dart';
import 'package:praxis/containers/data.dart';
import 'package:praxis/widgets/user/user_card.dart';

class UsersContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Data(builder: (context, vm) {
      return vm.users.isNotEmpty ? ListView.builder(
          shrinkWrap: true,
          itemCount: vm.users.length,
          itemBuilder: (context, index) {
            return UserCard(user: vm.users[index]);
          }) : Text("No hay usuarios almacenados", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),);
    });
  }
}
