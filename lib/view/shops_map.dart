import 'package:domace_front/view/common_layout.dart';
import 'package:domace_front/view/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ShopsMap extends StatefulWidget {
  @override
  _ShopsMapState createState() => _ShopsMapState();
}

class _ShopsMapState extends State<ShopsMap> {
  late GoogleMapController _mapController;
  LatLng? _currentPosition;
  bool _isLoading = true;
  int _selectedShopIndex = -1;

  final Set<Marker> _markers = {
    // Add sample markers (replace with actual shop locations)
    Marker(
      markerId: MarkerId('shop1'),
      position: LatLng(44.775194, 17.185869), // Example shop 1 location
      infoWindow: InfoWindow(title: 'Shop 1'),
    ),
    Marker(
      markerId: MarkerId('shop2'),
      position: LatLng(44.773350, 17.202595), // Example shop 2 location
      infoWindow: InfoWindow(title: 'Shop 2'),
    ),
    // Add more markers as needed
  };

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  _getUserLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double lat = position.latitude;
    double long = position.longitude;
    LatLng location = LatLng(lat, long);

    setState(() {
      _currentPosition = location;
      _isLoading = false;
    });
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onShopMarkerTapped(int index) {
    setState(() {
      _selectedShopIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      body: 
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 6, // 1/6 of the total width
              child: ListView.builder(
                itemCount: _markers.length,
                itemBuilder: (context, index) {
                  final marker = _markers.elementAt(index);
                  return ShopCard(
                    shopName: marker.infoWindow.title ?? '',
                    description: 'Shop description here', // Replace with actual description
                    onCardTapped: () {
                      _onShopMarkerTapped(index); // This will select the shop card
                      _mapController.animateCamera(
                        CameraUpdate.newLatLng(marker.position),
                      );
                    }
                  );
                },
              ),
            ),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _currentPosition!,
                        zoom: 14,
                      ),
                      markers: _markers
                          .map(
                            (marker) => Marker(
                              markerId: marker.markerId,
                              position: marker.position,
                              infoWindow: InfoWindow(
                                title: marker.infoWindow.title ?? '',
                              ),
                              onTap: () => _onShopMarkerTapped(
                                  _markers.toList().indexOf(marker)),
                            ),
                          )
                          .toSet(),
                      onMapCreated: onMapCreated,
                      myLocationEnabled: true,
                      onTap: (_) {
                        setState(() {
                          _selectedShopIndex = -1;
                        });
                      },
                    ),
            ),
          ],
        )
    ,title: "Search shops"
    ); 
    
  }
}