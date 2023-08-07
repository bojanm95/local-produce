import 'package:flutter/material.dart';
import 'package:domace_front/model/product_model.dart';
import 'package:domace_front/service/product_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late List<ProductModel>? _productModelList = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _productModelList = (await ProductService().getProducts())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _productModelList == null || _productModelList!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text("Product ID")),
                DataColumn(label: Text("Description")),
                DataColumn(label: Text("Product Category")),
                DataColumn(label: Text("Is valid?"))
              ],
              rows: List<DataRow>.generate(_productModelList!.length,
               (index) {
                return DataRow(
                  cells: [
                    DataCell(Text(_productModelList![index].productId.toString())),
                    DataCell(Text(_productModelList![index].description)),
                    DataCell(Text(_productModelList![index].productCategoryId.toString())),
                    DataCell(Checkbox(value: _productModelList![index].valid, onChanged: null,) )
                  ]);
               }),
            ),
          )
    );
  }
}