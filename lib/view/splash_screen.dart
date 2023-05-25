
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management/view/home_screen.dart';
import 'package:student_management/view/sign_up_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> goScreen()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String uid = prefs.getString('uid') ?? "0";
    if(uid !=  "44" ){
      print("________________ if : $uid");
      Future.delayed(const Duration(seconds: 2)).then((value) =>  Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage())));
    }else{
      print("________________ Else");
      Future.delayed(const Duration(seconds: 2)).then((value) =>  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen())));
    }
  }

  @override
  void initState(){
    goScreen();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Splash Scren"),),
    );
  }
}
