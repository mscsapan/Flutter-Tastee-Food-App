import 'dart:async';

import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ProductApi {
  String uri =
      'https://api.json-generator.com/templates/A9TYzWrmdzEK/data?access_token=ffba3new2vnxq3xt9j37yfbfwew1tcw62ymrdre2';

  Future<List<Product>> getProductApi() async {
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final List<Product> product = productFromJson(response.body);
      return product;
    }
    return getProductApi();
  }
}
