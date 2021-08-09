import 'package:ceramicstore/SharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  bool bitsian = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
        future: SharedPreferenceHelper().getUserinfo(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

          if (snapshot.hasData ){
            Map userinfo = snapshot.data;
            if ( ((userinfo["email"].split("@"))[1] == "goa.bits-pilani.ac.in" ||((userinfo["email"].split("@"))[1] == "pilani.bits-pilani.ac.in")||(userinfo["email"].split("@"))[1] == "pilani.bits-pilani.ac.in")) {



              return Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 90.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Your Profile',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              userinfo['imgUrl']),
                          radius: 65.0,
                        ),
                      ),



                      SizedBox(height: 18.0),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Icon(
                                  Icons.person_outline,
                                  color: Colors.deepOrangeAccent,
                                  size: 30.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name',style: TextStyle(color: Colors.deepOrangeAccent),),
                                    Text(userinfo['name']),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Icon(
                                  Icons.android,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text('username'),
                                    Text(userinfo['username']),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Icon(
                                  Icons.mail_outline,
                                  color: Colors.grey,
                                  size: 30.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Email'),
                                    Text(userinfo['email']),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }else{
              return Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 90.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Your Profile',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              userinfo['imgUrl']),
                          radius: 65.0,
                        ),
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Icon(Icons.stars_sharp,
                      //       color: Colors.orange,),
                      //
                      //   ],
                      //
                      // ),


                      SizedBox(height: 18.0),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Icon(
                                  Icons.person_outline,
                                  color: Colors.deepOrangeAccent,
                                  size: 30.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text('Name',style: TextStyle(color: Colors.deepOrangeAccent),),
                                    Text(userinfo['name']),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Icon(
                                  Icons.android,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text('username'),
                                    Text(userinfo['username']),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Icon(
                                  Icons.mail_outline,
                                  color: Colors.grey,
                                  size: 30.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text('Email'),
                                    Text(userinfo['email']),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );}}else {
            return Container(
                child: Center(child: CircularProgressIndicator()));
          }},),
    );
  }
}