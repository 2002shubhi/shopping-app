import 'package:ceramicstore/screens/home_page.dart';
import 'package:ceramicstore/New/auth.dart';

import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class LoginPage extends StatefulWidget{
  final Function toggle;
  LoginPage(this.toggle);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeBtn = false;

  AuthMethods authMethods = new AuthMethods();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  signIn() async {
    if (formKey.currentState.validate()) {  //yo
      setState(() {
        isLoading = true;
      });
      try {
        authMethods.signInWithEmailAndPassword(
            emailTextEditingController.text, passwordTextEditingController.text)
            .then((result)  {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Homepage()));
        });
      }catch(e){
        print(e.toString());
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return isLoading ? Container(
      child: Center(child: CircularProgressIndicator()),

    )
        : Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 50.0),
              Text(
                "Glad to have you here!",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,

                ),

              ),
              Image.asset(
                "assets/images/Learning.gif", fit: BoxFit.scaleDown,),

              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(height: 50.0),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     hintText: "Enter Email",
                    //     labelText: "Email",
                    //   ),
                    //   validator: (value){
                    //     if (value!.isEmpty){
                    //       return "Email cannot be empty";
                    //     }
                    //     return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) ? null : "Please provide a valid Email Id";
                    //
                    //
                    //   },
                    //
                    //   onChanged: (value) {
                    //     setState(() {
                    //
                    //     });
                    //   },
                    // ),
                    // TextFormField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //
                    //     hintText: "Enter Password",
                    //     labelText: "Password",
                    //
                    //   ),
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return "Password cannot be empty";
                    //     }
                    //     else if (value.length < 6) {
                    //       return "Password length cannot be less than 6 characters";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(height: 5),
                    // Container(
                    //   alignment: Alignment.centerRight,
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(horizontal: 16,
                    //         vertical: 8),
                    //     child: Text("Forgot Password?"),
                    //   ),
                    // ),
                    // SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // InkWell(
                        //
                        //   onTap: () => signIn(),
                        //   child: AnimatedContainer(
                        //     duration: Duration(milliseconds: 200),
                        //     width: changeBtn ? 50 : 150,
                        //     height: 40,
                        //
                        //     alignment: Alignment.center,
                        //     child: changeBtn
                        //         ? Icon(Icons.done, color: Colors.white)
                        //         : Text(
                        //       "Sign In",
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 12,
                        //         fontFamily: "Poppins",
                        //         // fontWeight: FontWeight.bold,
                        //       ),
                        //
                        //     ),
                        //     decoration: BoxDecoration(
                        //         color: Colors.deepOrangeAccent,
                        //         borderRadius: BorderRadius.circular(
                        //             changeBtn ? 50 : 15)
                        //     ),
                        //
                        //   ),
                        // ),
                        // SizedBox(width: 0),
                        // ElevatedButton(
                        //     child:
                        //     Text("Login"),
                        //     onPressed: (){},
                        //     style: ElevatedButton.styleFrom(
                        //       primary: Colors.deepOrangeAccent,
                        //       onPrimary: Colors.white,
                        //     )
                        // ),
                        // SizedBox(width: 15,),
                        // ElevatedButton(
                        //   child:
                        //   Text("Sign Up"),
                        //   onPressed: (){},
                        //   style: ElevatedButton.styleFrom(
                        //     primary: Colors.deepOrangeAccent,
                        //     onPrimary: Colors.white,
                        //   )
                        //   ),
                        Container(

                          padding: const EdgeInsets.all(0.0),

                          height: 40,
                          alignment: Alignment.center,
                          child: OutlinedButton.icon(

                            onPressed: () {
                              AuthMethods().signInWithGoogle(context);
                            },
                            icon: FaIcon(FontAwesomeIcons.google,
                                color: Colors.deepOrangeAccent),
                            label: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 10,


                                fontFamily: "Poppins",

                                // fontWeight: FontWeight.bold,
                              ),

                            ),
                            style: OutlinedButton.styleFrom(
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)))
                            ),

                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.deepOrangeAccent, width: 3),


                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(15)
                          ),


                        ),
                      ],

                    ),


                    SizedBox(height: 25.0),
                    // Row(mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text("Don't have an account?", style: TextStyle(
                    //       fontSize: 15,
                    //     ),
                    //     ),
                    //     SizedBox(width: 5,),
                    //     GestureDetector(
                    //       onTap: () {
                    //         widget.toggle();
                    //       },
                    //       child: Container(
                    //         padding: EdgeInsets.symmetric(vertical: 8),
                    //         child: Text("Register Now", style: TextStyle(
                    //           fontSize: 15,
                    //           decoration: TextDecoration.underline,
                    //
                    //         )
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }

}