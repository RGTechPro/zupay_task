import 'package:flutter/cupertino.dart';
import 'package:zupay_task/models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product>? productList;
  int? selectedIndex;
  List indices = [];
  List<Product> cartData = [];
  double totalPrice = 0;
  int selectedScreen = 0;
  bool addToCart(int index) {
    bool isExist = false;
    for (int i = 0; i < cartData.length; i++) {
      if (cartData[i].id == productList![index].id) {
        isExist = true;
      }
    }
    if (!isExist) {
      selectedIndex = index;

      indices.add(selectedIndex);

      Product val = productList!.elementAt(selectedIndex!);

      cartData.add(val);
      //  print(cartData[1].itemTitle);
      print('added');
      calculateTotalPrice();
    }
    notifyListeners();
    return isExist;
  }

  void removeItem(int index) {
    print('old index:$index');
    totalPrice = totalPrice - cartData[index].itemPrice!;
    cartData.removeAt(index);
    print('hi');
    print(cartData.length);

    print(indices);
    // indices.forEach((element) {
    //   print(element);
    // });
    print("index:$index");
    // indices.removeWhere((element) => element == index);
    calculateTotalPrice();
    notifyListeners();
  }

  void increasePrice(int index) {
    totalPrice = totalPrice + cartData[index].itemPrice!;
    notifyListeners();
  }

  void decreasePrice(int index) {
    totalPrice = totalPrice - cartData[index].itemPrice!;
    notifyListeners();
  }

  void calculateTotalPrice() {
    double temp = 0;
    for (int i = 0; i < cartData.length; i++) {
      temp = temp + cartData[i].itemPrice!;
    }
    totalPrice = temp;
  }
}
