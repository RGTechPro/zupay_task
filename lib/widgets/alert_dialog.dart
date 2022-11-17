import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';

showAlertDialog(BuildContext context, int index) {
  // set up the buttons
  Widget cancelButton = TextButton(
    style:
        ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
    child: Text(
      "Cancel",
      style: GoogleFonts.poppins(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    style:
        ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
    child: Text("Remove",
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
    onPressed: () {
      Provider.of<ProductProvider>(context, listen: false).removeItem(index);
           Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Remove item",
        style: GoogleFonts.poppins(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
    content: Text(
      "Are you sure you want to remove this item from the cart?",
      style: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
