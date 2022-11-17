import 'package:flutter/cupertino.dart';
import 'package:zupay_task/models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product>? productList;
  int? selectedIndex;
  List indices = [];
  List<Product> cartData = [];
  double totalPrice = 0;
  void addToCart(int index) {
    if (!indices.contains(index)) {
      selectedIndex = index;

      indices.add(selectedIndex);

      Product val = productList!.elementAt(selectedIndex!);

      cartData.add(val);
      //  print(cartData[1].itemTitle);
      print('added');
      calculateTotalPrice();
    }
  }
  // void removeItem(int index) {
  //   cartData.removeWhere((element) => element == cartdata[index].medicineName);
  //   cartdata[index].updatedMrp = cartdata[index].mrp;
  //   cartdata[index].itemcount = 1;
  //   cartdata.removeAt(index);
  //   updateTotalMrp();
  //   notifyListeners();
  // }

  void increasePrice(int index) {
    totalPrice = totalPrice + cartData[index].itemPrice!;
    notifyListeners();
  }

  void decreasePrice(int index) {
    totalPrice = totalPrice - cartData[index].itemPrice!;
    notifyListeners();
  }

  void calculateTotalPrice() {
    totalPrice = totalPrice + cartData[selectedIndex!].itemPrice!;
  }
}
