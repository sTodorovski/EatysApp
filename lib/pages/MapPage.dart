import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(42.003991, 21.410320),
    zoom: 13.5,
  );

  late GoogleMapController _googleMapController;
  static final Marker _BurgerHouse = Marker(
    markerId: MarkerId('_BurgerHouse'),
    infoWindow: InfoWindow(
        title: "Burger House", snippet: "Very good burgers, 5 stars!"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(42.003991, 21.410320),
  );

  static final Marker _WaffleHouse = Marker(
    markerId: MarkerId('_WaffleHouse'),
    infoWindow:
        InfoWindow(title: "Waffle House", snippet: "Best waffles in the city!"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(42.005898, 21.394718),
  );

  static final Marker _BurritoPlace = Marker(
    markerId: MarkerId('_BurritoPlace'),
    infoWindow: InfoWindow(
        title: "Burrito Place", snippet: "Very cozy and chill place!"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(41.994246, 21.409547),
  );

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
        markers: {
          _BurgerHouse,
          _WaffleHouse,
          _BurritoPlace,
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
