import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:domace_front/constants.dart';
import 'package:domace_front/model/product_model.dart';

class ProductService {
  Future<List<ProductModel>?> getProducts() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.productsEndpoint);
      var basicAuth = 'Basic ' + base64Encode(utf8.encode("admin:password"));
      print(basicAuth);
      var response = await http.get(url,
      headers: {
        "authorization": basicAuth
      }
      );
      if (response.statusCode == 200) {
        List<ProductModel> model = productModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}