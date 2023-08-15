import 'package:domace_front/view/add_shop_form.dart';
import 'package:domace_front/view/common_layout.dart';
import 'package:domace_front/view/shops_map.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: 'LocalProduce',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to LocalProduce!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopsMap()),
                );
              },
              child: Text('Start Exploring'),
            ),
          ],
        ),
      ),
    );
  }
}
