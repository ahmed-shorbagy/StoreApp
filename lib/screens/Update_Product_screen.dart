import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Models/Producte_model.dart';
import 'package:store_app/component/custom_button.dart';
import 'package:store_app/component/custom_text_field.dart';

import '../services/update_product_service.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'update product page';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? title, desc, image;
  num? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProducteModel product =
        ModalRoute.of(context)!.settings.arguments as ProducteModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Update Product',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  CustomTextField(
                    hintText: 'Product Name',
                    onChanged: (data) {
                      title = data;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      desc = data;
                    },
                    hintText: 'Desciption',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      price = num.parse(data);
                    },
                    hintText: 'Price',
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      image = data;
                    },
                    hintText: 'Image',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                        await updateProduct(product);

                        showSnackBar(context, 'Success');
                      } catch (e) {
                        showSnackBar(context, e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    },
                    buttonText: 'Update',
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future<void> updateProduct(ProducteModel product) async {
    void updateProduct() async {
      await UpdateProductService().updateProduct(
          id: product.id,
          title: title == null ? product.title : title!,
          price: price == null ? product.price : price!,
          desc: desc == null ? product.description : desc!,
          image: image == null ? product.image : image!,
          category: product.category);
    }
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(50),
      elevation: 30,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
