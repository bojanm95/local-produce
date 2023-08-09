// import 'dart:convert';
// import 'dart:developer';

// import 'package:http/http.dart' as http;
// import 'package:domace_front/constants.dart';
import 'package:domace_front/model/product_model.dart';

class ProductService {
  Future<List<ProductModel>?> getProducts() async {
    // try {
    //   var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.productsEndpoint);
    //   var basicAuth = 'Basic ' + base64Encode(utf8.encode("admin:password"));
    //   print(basicAuth);
    //   var response = await http.get(url,
    //   headers: {
    //     "authorization": basicAuth
    //   }
    //   );
    //   if (response.statusCode == 200) {
        // List<ProductModel> model = productModelFromJson(response.body);
        ProductModel model = ProductModel(productId: 1, description: "Product 1", productCategoryId: 1, valid: true);
        List<ProductModel> modelList = List.of([model]);
        return modelList;
      // }
    // } catch (e) {
      // log(e.toString());
    // }
    // return null;
  }
}