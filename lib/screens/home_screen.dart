import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../provider/product.dart';
import '../services/network_file.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    GestureDetector(child: Image.asset('assets/drawer.png')),
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
            height: 485,
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
                          id: data[index].id!,
                          index: index,
                        );
                      }),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 165 / 270),
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
      ],
    );
  }
}
