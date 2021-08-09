class ProductData{

  String title ="";
  String desc ="";
  String price ="";
  String imgUrl ="";
  String email ="";
  String name ="";


  ProductData.fromMap(Map<String,dynamic> data){


    title=data["title"];
    desc= data["desc"];
    price=data["price"];
    imgUrl=data["imageurl"];
    email=data["email"];
    name=data["name"];
  }
}