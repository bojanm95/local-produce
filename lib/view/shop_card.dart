import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final String shopName;
  final String description; // Add this property for the shop description
  final VoidCallback onCardTapped;

  ShopCard({required this.shopName, required this.description,required this.onCardTapped});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(shopName, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        onTap: onCardTapped,
        // Add any additional content or customization here
      ),
    );
  }
}