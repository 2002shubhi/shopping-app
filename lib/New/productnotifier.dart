import 'dart:collection';

import 'package:ceramicstore/New/productdetails.dart';
import 'package:flutter/cupertino.dart';

class   ProductNotifier with ChangeNotifier{
  List<ProductData> _productList =[];
  ProductData _currentData; //yas

  UnmodifiableListView<ProductData> get  productList => UnmodifiableListView(_productList);
  ProductData get  currentData => _currentData;

  set productList(List<ProductData> productList){
    _productList= productList;
    notifyListeners();

  }
  set currentData(ProductData current){
    _currentData=current;
    notifyListeners();

  }
  deletePro(ProductData productData){
    _productList.removeWhere((element) => element.imgUrl== productData.imgUrl);
    notifyListeners();
  }

}