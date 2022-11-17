import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zupay_task/widgets/alert_dialog.dart';

import '../provider/product.dart';

class CartCard extends StatefulWidget {
  CartCard(
      {required this.itemTitle,
      required this.itemImage,
      required this.itemPrice,
      required this.index});
  String itemImage;
  String itemTitle;
  double itemPrice;
  int index;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int quantity = 1;

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
                  widget.itemImage,
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
                      Text(widget.itemTitle,
                          maxLines: 3,
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
                      Text('\$ ${widget.itemPrice}',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (() {
                              setState(() {
                                if (quantity == 1) {
                                  showAlertDialog(context, widget.index);
                                } else if (quantity >= 2) {
                                  quantity--;
                                  Provider.of<ProductProvider>(context,
                                          listen: false)
                                      .decreasePrice(widget.index);
                                }
                              });
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffd1d9dd))),
                              child: Icon(Icons.remove),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: Text(quantity.toString(),
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 14)),
                          ),
                          GestureDetector(
                            onTap: (() {
                              setState(() {
                                quantity++;
                              });

                              Provider.of<ProductProvider>(context,
                                      listen: false)
                                  .increasePrice(widget.index);
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffd1d9dd))),
                              child: Icon(Icons.add),
                            ),
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
