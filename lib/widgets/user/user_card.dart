import 'package:flutter/material.dart';
import 'package:praxis/models/models.dart';
import 'package:praxis/widgets/user/user_detail_dialog.dart';

class UserCard extends StatelessWidget {
  final User user;

  UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: InkWell(
        child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.razonSocial!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                              Text(
                                user.contacto!,
                                style: TextStyle(color: Colors.grey),
                                maxLines: 1,
                              )
                            ],
                          )),
                      flex: 2,
                    ),
                    Icon(
                      Icons.info,
                      color: Colors.grey,
                    )
                  ],
                ),onTap: () => _showDetailUserDialog(context))));
  }

  void _showDetailUserDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return UserDetailDialog(user: user);
        });
  }
}
