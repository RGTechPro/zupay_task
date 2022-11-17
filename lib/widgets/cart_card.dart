import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCard extends StatelessWidget {
  CartCard(
      {required this.itemTitle,
      required this.itemImage,
      required this.itemPrice,required this.index});
  String itemImage;
  String itemTitle;
  double itemPrice;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff3f4f6),
      height: 115,
      child: Column(
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  itemImage,
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                ),
                Container(
                  width: 130,
                  height: 81,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(itemTitle,
                          style: GoogleFonts.poppins(
                              color: Color(0xff4B4A5A),
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text('Size: ',
                                  style: GoogleFonts.poppins(
                                      color: Color(0xffAFBEC4), fontSize: 12)),
                              Text('S',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: [
                              Text('Color: ',
                                  style: GoogleFonts.poppins(
                                      color: Color(0xffAFBEC4), fontSize: 12)),
                              Icon(
                                Icons.rectangle_rounded,
                                color: Colors.black,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 81,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$ ${itemPrice}',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffd1d9dd))),
                            child: Icon(Icons.remove),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: Text('1',
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 14)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffd1d9dd))),
                            child: Icon(Icons.add),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 0.5,
            color: Color(0xffd1d9dd),
          ),
        ],
      ),
    );
  }
}
