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
import 'package:zupay_task/screens/home_screen.dart';
import 'package:zupay_task/services/network_file.dart';
import 'package:zupay_task/widgets/product_card.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:badges/badges.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F4F6),
      body: SafeArea(
        child: Column(
          children: [
            (selectedIndex == 0 ? HomeScreen() : CartPage()),
            if (selectedIndex == 0)
              Consumer<ProductProvider>(
                builder: (context, value, child) {
                  return Container(
                    height: 118,
                    color: Colors.white,
                    child: GNav(
                        selectedIndex: 0,
                        onTabChange: (value) {
                          setState(() {
                            selectedIndex = value;
                          });
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
                              textStyle:
                                  GoogleFonts.poppins(color: Colors.black)),
                          GButton(
                              leading: Badge(
                                  badgeContent: Text(
                                      Provider.of<ProductProvider>(context,
                                              listen: true)
                                          .cartData
                                          .length
                                          .toString()),
                                  showBadge: true,
                                  child: Icon(
                                    CustomIcons.bag,
                                    color: Color(0xffAFBEC4),
                                  )),
                              icon: CustomIcons.bag,
                              text: 'Bag',
                              textStyle:
                                  GoogleFonts.poppins(color: Colors.black))
                        ]),
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}
