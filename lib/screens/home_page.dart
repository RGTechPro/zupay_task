import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zupay_task/custom_icons_icons.dart';
import 'package:zupay_task/models/product.dart';
import 'package:zupay_task/provider/product.dart';
import 'package:zupay_task/screens/cart_page.dart';
import 'package:zupay_task/services/network_file.dart';
import 'package:zupay_task/widgets/product_card.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:badges/badges.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                        GestureDetector(
                            child: Image.asset('assets/drawer.png')),
                        GestureDetector(
                          child: Image.asset('assets/search.png'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 19),
                    child: Text(
                      'New Arrivals',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontWeight: FontWeight.bold)),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 514,
                child: FutureBuilder<List<Product>>(
                    future: fetchProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                            child: Text(
                          'Something went wrong',
                          //   style: kMessageText,
                        ));
                      }

                      if (snapshot.hasData && !snapshot.data!.isNotEmpty) {
                        return Text("Error");
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        Provider.of<ProductProvider>(context, listen: false)
                            .productList = snapshot.data;
                        var data = snapshot.data;
                        print(data![1].itemTitle);
                        return GridView.builder(
                          itemCount: data.length,
                          itemBuilder: ((context, index) {
                            return ProductCard(
                                itemTitle: data[index].itemTitle!,
                                itemCategory: data[index].itemCategory!,
                                itemImage: data[index].itemImage!,
                                itemPrice: data[index].itemPrice!,
                                id: data[index].id!,index: index,);
                          }),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 165 / 270),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      );
                    }),
              ),
            ),
            Container(
              height: 90,
              color: Colors.white,
              child: GNav(
                  onTabChange: (value) {
                    if (value == 0) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else if (value == 1) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
                    }
                  },
                  color: Color(0xffAFBEC4),
                  padding: EdgeInsets.all(20),
                  tabBorderRadius: 30,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  gap: 13.2,
                  tabBackgroundColor: Color(0xfff0f0f3),
                  tabs: [
                    GButton(
                        icon: CustomIcons.home,
                        text: 'Home',
                        textStyle: GoogleFonts.poppins(color: Colors.black)),
                    GButton(
                        icon: CustomIcons.bag,
                        text: 'Bag',
                        textStyle: GoogleFonts.poppins(color: Colors.black))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
