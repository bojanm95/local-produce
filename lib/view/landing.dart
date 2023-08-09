
import 'package:domace_front/view/shops_map.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _exploring = false;

  void _startExploring() {
    setState(() {
      _exploring = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LocalProduce'),
      ),
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
                _startExploring();
              },
              child: Text('Start Exploring'),
            ),
          if (_exploring)
            Expanded(
              child: ShopsMap(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8, // Add elevation to the BottomNavigationBar
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
