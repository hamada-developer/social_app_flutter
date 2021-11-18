import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: TextButton(
        child: const Text('char screen'),
        onPressed: (){
          String? name ;
          String student = name?? 'unknown';
          print(student);
        },
      ),
    );
  }
}
