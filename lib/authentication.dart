import 'package:ceramicstore/screens/login_page.dart';
import 'package:ceramicstore/screens/signup.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn =true;
  void toggleView(){
    setState(() {
      showSignIn= !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return LoginPage(toggleView);

    }else{
      return SignUp(toggleView);
    }
  }
}