import 'dart:io';
import 'package:ceramicstore/SharedPreferences.dart';
import 'package:ceramicstore/New/Config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';
import 'package:ceramicstore/New/Config.dart';
import 'nav_bottom.dart';


class Seller extends StatefulWidget {



  @override
  _SellerState createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  Reference ref;//yay


  List<File> _image = [];
  final picker = ImagePicker();


  final formKey1 = GlobalKey<FormState>();
  TextEditingController titleTextEditingController = new TextEditingController();
  TextEditingController descTextEditingController = new TextEditingController();
  TextEditingController priceTextEditingController = new TextEditingController();
  Future UploadItem(
      Map<String, dynamic> ItemInfo) async{
    print(ItemInfo);
    return FirebaseFirestore.instance
        .collection("items")
        .add(ItemInfo);

  }

  UploadIt() async{

    if (formKey1.currentState.validate()&& _image[0]!=null){//yo
      UploadImage();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: formKey1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                      "assets/images/upload.png", fit: BoxFit.scaleDown),

                  TextFormField(
                    controller: titleTextEditingController,
                    decoration: InputDecoration(
                      hintText: "Enter Name of your Product",
                      labelText: "Name",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {//yo
                        return "Name cannot be Empty";
                      }
                      return null;
                    },

                  ),
                  TextFormField(
                    controller: descTextEditingController,
                    decoration: InputDecoration(
                      hintText: "About",
                      labelText: "Describe your product",
                    ),
                    validator: (value) {
                      if (value.isEmpty || value.length < 15) {//yo
                        return "Description cannot be less than 15 characters";
                      }
                      return null;
                    },

                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly],
                    controller: priceTextEditingController,
                    decoration: InputDecoration(
                      hintText: "Price",
                      labelText: "Enter your price",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {//yo
                        return "Price cannot be empty";
                      }
                      return null;
                    },

                  ),
                  SizedBox(height:5,),
                  Card(
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: _image.length + 1,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index){
                      return index == 0
                          ? Center(
                          child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                return
                                  chooseImage();}
                          )
                      )
                          :Container(

                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(_image[index-1]),
                                fit: BoxFit.cover)),
                      );

                    }),
                  ),
                  OutlinedButton.icon(

                    onPressed: () {UploadIt();},
                    icon: FaIcon(FontAwesomeIcons.upload,
                        color: Colors.deepOrangeAccent),
                    label: Text(
                      "Sell your Product",
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 15,


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
                  SizedBox(height: 40,)










                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  chooseImage() async {

    final pickedFile = await picker.getImage(source: ImageSource.gallery,imageQuality: 50);
    setState(() {
      if (_image.length>0){_image.removeLast();}
      _image.add(File(pickedFile.path));//yo
    });
    if (pickedFile.path == null) retrieveLostData();//yo
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file.path));//yo
      });
    } else {
      print(response.file);
    }
  }
  Future UploadImage() async{
    var img =_image[0];
    ref = FirebaseStorage.instance.ref().child('images/${Path.basename(img.path)}');
    await ref.putFile(img).whenComplete(() async{//yo
      await ref.getDownloadURL().then((value)async{//yo
        await SharedPreferenceHelper().getUserinfo().then((snapshot){
          // var uuid = Uuid();
          // var v4 = uuid.v4();
          // print(v4);

          Map<String, dynamic> itemInfo = {
            "name":snapshot["name"],
            "email":snapshot["email"],
            "desc": descTextEditingController.text,
            "imageurl": value,
            "price": priceTextEditingController.text,
            "title": titleTextEditingController.text};
          DatabaseMethods().UploadItem(descTextEditingController.text,itemInfo);
        });
      });
    });




  }
}