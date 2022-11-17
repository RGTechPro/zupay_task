import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:zupay_task/custom_icons_icons.dart';
import 'package:zupay_task/widgets/cart_card.dart';

import '../provider/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F4F6),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 64, left: 24, right: 24, bottom: 42),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(child: Image.asset('assets/back.png')),
                        Text('Your Cart',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        SizedBox(
                          width: 25,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 460,
                child: (Provider.of<ProductProvider>(context, listen: false)
                            .indices
                            .length !=
                        null)
                    ? ListView.builder(
                        itemCount:
                            Provider.of<ProductProvider>(context, listen: false)
                                .indices
                                .length,
                        itemBuilder: (context, index) {
                       
                          return CartCard(
                            itemImage: Provider.of<ProductProvider>(context,
                                    listen: false)
                                .cartData[index]
                                .itemImage!,
                            itemPrice: Provider.of<ProductProvider>(context,
                                    listen: false)
                                .cartData[index]
                                .itemPrice!,
                            itemTitle: Provider.of<ProductProvider>(context,
                                    listen: false)
                                .cartData[index]
                                .itemTitle!,
                            index: index,
                          );
                        })
                    : Center(
                        child: Text('No items in the cart',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16))),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                  Text('\$ ${Provider.of<ProductProvider>(context).totalPrice.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: double.infinity,
                height: 64,
                child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    child: Text('Payment',
                        style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.white)))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
