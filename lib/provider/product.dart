import 'package:flutter/cupertino.dart';
import 'package:zupay_task/models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product>? productList;
  int? selectedIndex;
  List indices = [];
  List<Product>? cartData;
  void addToCart(int index) {
    print('lo');
    print(index);
    // if (!indices.contains(index)) {
    print('hi');
    selectedIndex = index;
    print('lol');
    print(selectedIndex);
    indices.add(selectedIndex);
    print(indices);
    Product val = productList!.elementAt(selectedIndex!);
    cartData!.add(val);
    //  }
  }
}
