import 'dart:ui';
import 'package:ceramicstore/SharedPreferences.dart';
import 'package:ceramicstore/New/productnotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ceramicstore/New/Config.dart';

class ProductDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ProductNotifier productNotifier = Provider.of<ProductNotifier>(
        context, listen: false);
    return Scaffold(


      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 5.0, horizontal: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                        children: [
                          Image.network(productNotifier.currentData.imgUrl, fit: BoxFit.fill,),
                          Positioned.fill(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                              child: Container(color: Colors.orangeAccent.withOpacity(0.1)),


                            ),
                          ),
                          Positioned.fill(

                            child: Padding(

                              padding: const EdgeInsets.all(60),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25)),

                                child: Card(
                                  color: Colors.transparent,




                                  child :Hero(tag:productNotifier.currentData.imgUrl,child: Image.network(productNotifier.currentData.imgUrl, fit: BoxFit.cover)),



                                ),
                              ),
                            ),
                          ),

                        ])




                ),



                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Text('Price: Rs ${productNotifier.currentData.price}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  )),
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(const Radius.circular(20)),
                                  color: Color(0xFFFFEDD5)
                              ),
                            ),

                          ]
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text('Description: ${productNotifier.currentData.desc}',
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize:18.0
                            ),),
                        ),
                      ),
                      Center(
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical:15,horizontal:45),
                          onPressed: () async{
                            Map<String, dynamic> userInfoMap =await SharedPreferenceHelper().getUserinfo();
                            String myuserName = (userInfoMap["email"]);
                            String myUserName =myuserName.split("@")[0];
                            String username=(productNotifier.currentData.email.split("@"))[0];
                          }
                      ),
                      ),
                    ],

                  ),
                ),
              ],

            )
        ),
      ),


    );

  }
}
String getChatRoomIdByUsernames(String a, String b) {
  if (a.compareTo(b)==1) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}