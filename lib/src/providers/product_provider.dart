import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logincomplete/src/model/product_model.dart';

class ProductsProvider {
  final String _url = 'https://flutter-app-6019a-default-rtdb.firebaseio.com';

  Future<bool> productCreate(ProductModel productModel) async {
    final  url =Uri.parse('$_url/product.json') ;
    final response =
        await http.post(url, body: productModelToJson(productModel));
    final decodeData = json.decode(response.body);
    print(decodeData);
    return true;
  }
}
