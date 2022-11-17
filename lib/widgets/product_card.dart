import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {required this.itemTitle,
      required this.itemCategory,
      required this.itemImage,
      required this.itemPrice,
      required this.id,
      required this.index});
  String itemImage;
  String itemTitle;
  String itemCategory;
  double itemPrice;
  int index;
  int id;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(6.5),
        child: Container(
          color: Colors.white,
          height: 270,
          width: 165,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 175,
                child: FittedBox(
                  child: Image.network(
                    itemImage,
                    height: 180,
                    width: 175, fit: BoxFit.fill,
                    // fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 12),
                child: Text(itemCategory,
                    style: GoogleFonts.poppins(
                        color: Color(0xff7154B8), fontSize: 10)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 8),
                child: Text(itemTitle,
                    maxLines: 4,
                    style: GoogleFonts.poppins(
                        color: Color(0xff4B4A5A), fontSize: 11)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, bottom: 12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$ $itemPrice',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.3),
                        child: GestureDetector(
                          onTap: () {  print(index);
                            Provider.of<ProductProvider>(context, listen: false)
                                .addToCart(index);
                          
                          },
                          child: Image.asset('assets/bag.png'),
                        ),
                      )
                    ]),
              )
            ],
            //
          ),
        ),
      ),
    );
  }
}
