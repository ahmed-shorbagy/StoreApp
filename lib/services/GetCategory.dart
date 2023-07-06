import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/Models/Producte_model.dart';
import 'package:store_app/helper/APi_Model.dart';

class GetCategory {
  Future<List<dynamic>> getCategory({required categoryName}) async {
    List<dynamic> data = await APi()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName?');
    List<ProducteModel> categoryList = [];

    for (int i = 0; i < data.length; i++) {
      categoryList.add(ProducteModel.fromjson(data[i]));
    }

    return categoryList;
  }
}
