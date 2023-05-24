
import 'package:flutter/material.dart';
import 'package:student_management/view/sign_up_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
