import 'package:store_app/Models/Producte_model.dart';
import 'package:store_app/helper/APi_Model.dart';
import 'package:http/http.dart' as http;

class UpdateProductService {
  Future<dynamic> updateProduct(
      {required String title,
      required num price,
      required String desc,
      required String image,
      required String category,
      required int id}) async {
    Map<String, dynamic> data =
        await APi().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    });
    return ProducteModel.fromjson(data);
  }
}
