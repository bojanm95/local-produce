import 'package:domace_front/model/shop_model.dart';
import 'package:domace_front/service/product_service.dart';
import 'package:domace_front/service/shop_service.dart';
import 'package:domace_front/view/common_layout.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddShopForm extends StatefulWidget {
  @override
  _AddShopFormState createState() => _AddShopFormState();
}

class _AddShopFormState extends State<AddShopForm> {
  final _formKey = GlobalKey<FormState>();

  int? shopId;
  String? name;
  String? description;
  LatLng? selectedLocation;
  LatLng? _currentPosition;
  bool _isLoading = true;

  GoogleMapController? _mapController;
  Set<Marker> _markers = {};

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

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onMapTap(LatLng position) {
    setState(() {
      selectedLocation = position;
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId('selected_location'),
        position: position,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: "Add shop", 
      body: 
          Padding(
            padding: EdgeInsets.fromLTRB(200,20,200,20),
            child: Form(
              key: _formKey,
              child: Material(
                child: 
                  Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Shop ID'),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Please enter a shop ID';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        shopId = int.parse(value!);
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
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Please enter a shop name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        name = value!;
                      },
                    ),
                    Padding(padding: EdgeInsets.all(5),
                      child: Text(
                        "Select a location: ",
                        style: TextStyle(
                          fontSize: 18
                        )
                      )
                    ),
                    Padding(padding: EdgeInsets.all(5),
                      child: Text(
                        "Latitude: ${selectedLocation?.latitude ?? '-' } Longitude: ${selectedLocation?.longitude ?? "-"}",
                        style: TextStyle(
                          fontSize: 18
                        )
                      )
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5, // Adjust the height as needed
                      child: _isLoading
                        ? Center(child: CircularProgressIndicator()) :
                        GoogleMap(
                          onMapCreated: _onMapCreated,
                          onTap: _onMapTap,
                          markers: _markers,
                          initialCameraPosition: CameraPosition(
                            target: _currentPosition!,
                            zoom: 14.0,
                          ),
                        ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ShopModel shop = ShopModel(
                            shopId: shopId!,
                            name: name!,
                            description: description!,
                            location: selectedLocation!,
                          );
                          ShopService().saveShop(shop);
                        }
                      },
                      child: Text('Add my shop!'),
                    ),
                  ],
                ),
              ),
            )
          )
    );
  }
}