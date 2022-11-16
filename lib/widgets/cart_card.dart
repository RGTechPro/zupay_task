import 'package:flutter/cupertino.dart';
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
      child: Row(children: [
        Image.asset(
          'assets/girl.png',
          height: 80,
          width: 80,
          fit: BoxFit.fill,
        ),

        Column(
          children: [
            Text('Me Bandage Black Dress',
            style: GoogleFonts.poppins(
                      color: Color(0xff4B4A5A), fontSize: 12)
            )
          ],
        )
      ]),
    );
  }
}
