import 'package:domace_front/view/add_shop_form.dart';
import 'package:domace_front/view/shops_map.dart';
import 'package:flutter/material.dart';

class CommonLayout extends StatelessWidget {
  final String title;
  final Widget body;

  const CommonLayout({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Produce - $title"),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          if(index == 0){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopsMap())
            )
          } else if(index == 1){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddShopForm())
            )
          }
        },
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Register Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Find Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Suggestions',
          ),
        ],
      ),
    );
  }
}
