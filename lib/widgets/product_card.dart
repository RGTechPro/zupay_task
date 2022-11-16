import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.5),
      child: Container(
        color: Colors.white,
        height: 270,
        width: 165,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: 175,
              child: FittedBox(
                child: Image.asset(
                  'assets/girl.png',
                  height: 180,
                  width: 175, fit: BoxFit.fill,
                  // fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13, left: 12),
              child: Text('Nicole Miller',
                  style: GoogleFonts.poppins(
                      color: Color(0xff7154B8), fontSize: 10)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 8),
              child: Text('Me Bandage Dress',
                  style: GoogleFonts.poppins(
                      color: Color(0xff4B4A5A), fontSize: 12)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, bottom: 12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$110.00',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.3),
                      child: GestureDetector(
                        child: Image.asset('assets/bag.png'),
                      ),
                    )
                  ]),
            )
          ],
          //
        ),
      ),
    );
  }
}