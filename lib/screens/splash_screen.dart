import'dart:async';
import 'package:ceramicstore/authentication.dart';
import 'package:ceramicstore/screens/nav_bottom.dart';
import 'package:ceramicstore/New/auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Splash extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => Screen()
            )
        )
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Lottie.asset('assets/lottie/splash.json')
        )
    );
  }
}
class Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      home: FutureBuilder(
        future: AuthMethods().getCurrentUser(),
        builder: (context , AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasData){
            return MyHomePage();
          }else{
            return Authenticate();
          }
        },
      ),
      debugShowCheckedModeBanner: false,);
  }
}