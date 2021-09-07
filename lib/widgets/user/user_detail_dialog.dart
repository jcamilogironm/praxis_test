import 'package:flutter/material.dart';
import 'package:praxis/models/models.dart';

class UserDetailDialog extends StatelessWidget {
  final User user;

  UserDetailDialog({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(color: Colors.grey, fontSize: 17);
    final descriptionStyle =
        TextStyle(fontSize: 17, fontWeight: FontWeight.bold);

    return SimpleDialog(
      title: Text(user.razonSocial!),
      contentPadding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      children: [
        Text("Contacto", style: titleStyle),
        Text(
          user.contacto!,
          maxLines: 2,
          style: descriptionStyle,
        ),
        SizedBox(height: 10,),
        Text("Dirección", style: titleStyle),
        Text(
          user.direccion!,
          maxLines: 2,
          style: descriptionStyle,
        ),
        Divider(),
        SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Municipio",
            style: titleStyle,
          ),
          Text(
            user.municipio!,
            style: descriptionStyle,
          )
        ]),
        SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Modalidad",
            style: titleStyle,
          ),
          Text(
            user.modalidad!,
            style: descriptionStyle,
          )
        ]),
        SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Télefono",
            style: titleStyle,
          ),
          Text(
            user.telefono!,
            style: descriptionStyle,
          )
        ]),
        SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Frecuencia",
            style: titleStyle,
          ),
          Text(
            user.frecuencia!,
            style: descriptionStyle,
          )
        ]),
      ],
    );
  }
}
