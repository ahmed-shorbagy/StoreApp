import 'dart:convert';

import 'package:store_app/Models/Producte_model.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/APi_Model.dart';

class GetAllProductService {
  Future<List<ProducteModel>> getAllProducts() async {
    List<dynamic> data =
        await APi().get(url: 'https://fakestoreapi.com/products');

    List<ProducteModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProducteModel.fromjson(data[i]));
    }
    return productsList;
  }
}
