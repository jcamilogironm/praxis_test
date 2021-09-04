import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final String message;

  LoadingIndicator({Key? key, this.message = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        CircularProgressIndicator(),
        SizedBox(height: 10,),
        Visibility(child: Text(message, style: TextStyle(fontSize: 16, color: Colors.grey.shade600)), visible: message.isNotEmpty)
      ],) ,
    );
  }
}
