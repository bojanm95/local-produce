import 'package:domace_front/model/product_model.dart';
import 'package:domace_front/service/product_service.dart';
import 'package:flutter/material.dart';

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();

  int? productId;
  String? description;
  int? productCategoryId;
  bool? valid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Product ID'),
              validator: (value) {
                if (value?.isEmpty == true) {
                  return 'Please enter a product ID';
                }
                return null;
              },
              onSaved: (value) {
                productId = int.parse(value!);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value?.isEmpty == true) {
                  return 'Please enter a description';
                }
                return null;
              },
              onSaved: (value) {
                description = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Product Category ID'),
              validator: (value) {
                if (value?.isEmpty == true) {
                  return 'Please enter a product category ID';
                }
                return null;
              },
              onSaved: (value) {
                productCategoryId = int.parse(value!);
              },
            ),
            SwitchListTile(
              title: Text('Valid'),
              value: valid ?? false,
              onChanged: (value) {
                setState(() {
                  valid = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ProductModel product = ProductModel(
                    productId: productId!,
                    description: description!,
                    productCategoryId: productCategoryId!,
                    valid: valid!,
                  );
                  ProductService().saveProduct(product);
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}