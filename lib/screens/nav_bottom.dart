
import 'package:ceramicstore/screens/display_page.dart';
import 'package:ceramicstore/screens/sell.dart';
import 'package:ceramicstore/Widgets/drawer.dart';
import 'package:ceramicstore/Widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
var tstyle = TextStyle(color: Colors.white.withOpacity(0.6),
    fontSize: 50
);
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var padding = EdgeInsets.symmetric(horizontal: 18,vertical: 5);
  double gap =10;

  int _index = 0;
  List<Color> colors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  List<Widget> text = [
    HomePage(),
    Seller(),


  ];
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("The Ceramic Store",style: TextStyle(color: Colors.deepOrangeAccent,fontFamily: "Poppins",fontSize: 28,fontWeight: FontWeight.bold),),


          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: ColorMe.cadetgrey,

          ),
        ),
        drawer: MyDrawer(),

        extendBody: true,
        body:PageView.builder(
            itemCount: 4,
            controller: controller,
            onPageChanged: (page){
              setState(() {
                _index= page;
              });
            },
            itemBuilder:(context,position){
              return Container(
                color: colors[position],
                child:Center(child: text[position]),
              );
            }),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: -10,
                    blurRadius: 60,
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0,25),
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 3),
              child: GNav(
                curve: Curves.easeInOutExpo,
                duration: Duration(milliseconds: 900),
                tabs: [
                  GButton(
                    gap: gap,
                    icon: LineIcons.home,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.orange,
                    text: 'Home',
                    textColor: Colors.orange,
                    backgroundColor: Colors.orange.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),

                  GButton(
                    gap: gap,
                    icon: LineIcons.plusCircle,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.orange,
                    text: 'Sell',
                    textColor: Colors.orange,
                    backgroundColor: Colors.orange.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),

                ],
                selectedIndex: _index,
                onTabChange: (index){
                  setState(() {
                    _index =index;
                  });
                  controller.animateToPage(index,duration: Duration(milliseconds: 1000),curve: Curves.easeInOutExpo);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
