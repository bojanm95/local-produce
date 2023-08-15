
import 'package:domace_front/model/shop_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class ShopService {

  var logger = Logger();

  Future<List<ShopModel>?> getShops() async {
    ShopModel model = ShopModel(shopId: 1, name: "Shop 1", description: "A simple shop", location: LatLng(44.775194, 17.185869));
    List<ShopModel> modelList = List.of([model]);
    return modelList;
  }

  Future<ShopModel?> saveShop(ShopModel shopModel) async {
    logger.i("Shop ${shopModel.toString()} saved!");
    return shopModel;
  }
}