import 'package:ceramicstore/screens/details.dart';
import 'package:ceramicstore/New/Config.dart';
import 'package:ceramicstore/New/auth.dart';
import 'package:ceramicstore/New/productdetails.dart';
import 'package:ceramicstore/New/productnotifier.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:velocity_x/velocity_x.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;



  @override
  void initState() {
    ProductNotifier productNotifier=Provider.of<ProductNotifier>(context, listen: false);
    getProduct(productNotifier);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ProductNotifier productNotifier=Provider.of<ProductNotifier>(context);

    return Scaffold(
        backgroundColor: Colors.white54,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (productNotifier.productList!= null)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Decor".text.xl5.bold.color(Colors.deepOrangeAccent).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductNotifier productNotifier=Provider.of<ProductNotifier>(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productNotifier.productList.length,
      itemBuilder: (context, index) {
        final catalog = productNotifier.productList[index];
        return CatalogItem(index,catalog);
      },
    );
  }
}

// ignore: must_be_immutable
class CatalogItem extends StatelessWidget {
  final ProductData catalog;
  bool Myad = false;
  final int index;


  CatalogItem(this.index, this.catalog);

  @override
  Widget build(BuildContext context) {
    ProductNotifier productNotifier=Provider.of<ProductNotifier>(context);
    return Container(
      decoration: BoxDecoration(
        //     boxShadow: [
        //   BoxShadow(
        //   color: Colors.grey.withOpacity(0.3),
        //   spreadRadius: 3,
        //   blurRadius: 7,
        //   offset: Offset(0, 0), // changes position of shadow
        // ),
        // ],
      ),

      child: GestureDetector(
        onTap: (){

          productNotifier.currentData =productNotifier.productList[index];
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ProductDetails()

          ));

        },
        child: VxBox(


          child: Row(
            children: [
              CatalogImage(
                catalog.imgUrl,
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        catalog.title.text.lg.color(Colors.blueGrey).bold.make(),
                        Text(
                          catalog.desc,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                        10.heightBox,
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          buttonPadding: EdgeInsets.zero,
                          children: [
                            "By ${catalog.name}".text.make(),
                            "₹ ${catalog.price}".text.bold.xl.make().pOnly(right: 8.0),

                          ],
                        )] ))
            ],
          ),
        ).orange50.rounded.square(150).make().py16(),
      ),
    ) ;

  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  CatalogImage(this.image);

  @override
  Widget build(BuildContext context) {
    return Hero(tag:image,
      child: Image.network(
        image,
      ).box.rounded.p8.color(Color(0xFFFED7AA)).make().p16().w40(context),
    );
  }
}

