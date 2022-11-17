import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff3f4f6),
      height: 150,
      child: Column(
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/girl.png',
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                ),
                Column(
                  //    mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Me Bandage Black Dress',
                        style: GoogleFonts.poppins(
                            color: Color(0xff4B4A5A),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 25,
                    ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('\$ 69.00',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 25,
                    ),
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
                )
              ]),
          Divider(
            thickness: 0.5,
            color: Color(0xffd1d9dd),
          )
        ],
      ),
    );
  }
}
