import 'package:ceramicstore/screens/home_page.dart';
import 'package:ceramicstore/New/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  AuthMethods authMethods =new AuthMethods();

  final formKey = GlobalKey<FormState>();

  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  signMEUP() {
    if (formKey.currentState.validate()) { //yo
      setState(() {
        isLoading =true;
      });
      authMethods.signUpwithEmailandPassword(emailTextEditingController.text, passwordTextEditingController.text).then((value){
        //print("${value.uid}");

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()

        ));
      });

    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: isLoading ? Container(
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
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,

                  ),

                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 25.0),
                      TextFormField(
                        controller: userNameTextEditingController,
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value){
                          if (value.isEmpty || value.length<4){
                            return "Username cannot be less than 4 characters";
                          }
                          return null;

                        },

                      ),
                      TextFormField(
                        controller: emailTextEditingController,
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "Email",
                        ),
                        validator: (value){
                          if (value.isEmpty){
                            return "Email cannot be empty";
                          }
                          return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) ? null : "Please provide a valid Email Id";


                        },

                      ),
                      TextFormField(
                        controller: passwordTextEditingController,
                        obscureText: true,
                        decoration: InputDecoration(

                          hintText: "Enter Password",
                          labelText: "Password",

                        ),
                        validator: (value){
                          if (value==null){
                            return "Password cannot be empty";
                          }
                          else if (value.length<6){
                            return"Password length cannot be less than 6 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 5),
                      SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              signMEUP();
                            },
                            child: InkWell(

                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: 150,
                                height: 40,

                                alignment: Alignment.center,
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "Poppins",
                                    // fontWeight: FontWeight.bold,
                                  ),

                                ),
                                decoration: BoxDecoration(
                                    color: Colors.deepOrangeAccent,
                                    borderRadius: BorderRadius.circular(15)
                                ),

                              ),
                            ),
                          ),
                          SizedBox(width: 10),
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

                        ],

                      ),


                      SizedBox(height: 25.0),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",style: TextStyle(
                            fontSize: 15,
                          ),
                          ),
                          SizedBox(width: 5,),
                          GestureDetector(
                            onTap: (){
                              widget.toggle();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text("Sign In",style: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.underline,

                              )
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Image.asset("assets/images/read_img.png",fit: BoxFit.scaleDown,)


              ],
            ),
          ),
        ),
      ),

    );
  }
}