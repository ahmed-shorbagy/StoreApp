import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Models/Producte_model.dart';
import 'package:store_app/screens/Update_Product_screen.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product});
  ProducteModel product;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(clipBehavior: Clip.none, children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, UpdateProductPage.id,
              arguments: product),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(0))
            ]),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 10),
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$' '${product.price.toString()}'),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
              elevation: 10,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          left: 65,
          top: -50,
          child: Image.network(
            product.image,
            height: 100,
            width: 100,
          ),
        )
      ]),
    );
  }
}
