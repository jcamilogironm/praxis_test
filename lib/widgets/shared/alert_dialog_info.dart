import 'package:flutter/material.dart';

class AlertDialogInfo extends StatelessWidget {
  final String message;
  final String title;

  AlertDialogInfo({Key? key, required this.message, this.title = "Atencion"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Aceptar")),
      ],
    );
  }
}
