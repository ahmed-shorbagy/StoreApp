import 'package:store_app/Models/Producte_model.dart';
import 'package:store_app/helper/APi_Model.dart';
import 'package:http/http.dart' as http;

class AddProduct {
  Future<dynamic> addProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data =
        await APi().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    });
    return ProducteModel.fromjson(data);
  }
}
