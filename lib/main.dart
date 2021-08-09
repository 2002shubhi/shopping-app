import 'package:ceramicstore/authentication.dart';
import 'package:ceramicstore/screens/display_page.dart';
import 'package:ceramicstore/screens/home_page.dart';
import 'package:ceramicstore/screens/splash_screen.dart';
import 'package:ceramicstore/New/productnotifier.dart';
import 'package:ceramicstore/routes.dart';
import 'package:ceramicstore/Widgets/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (BuildContext context) { return ProductNotifier(); },)
  ],
    child: MyApp(),));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      routes: {
        MyRoutes.homeRoute:(context)=>Homepage(),
        MyRoutes.loginRoute:(context)=>Authenticate(),
        '/product':(context)=>HomePage(),


      },
      debugShowCheckedModeBanner: false,
    );
  }
}
