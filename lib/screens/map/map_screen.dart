import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:ecommerce_app/services/location_service.dart';
import 'package:ecommerce_app/widgets/app_bar_action_button.dart';
import 'package:ecommerce_app/models/location.dart';
import 'package:ecommerce_app/widgets/screen_wrapper.dart';

class MapScreenArguments {
  final Location? location;

  MapScreenArguments({
    this.location,
  });
}

class MapScreen extends StatefulWidget {
  static const routeName = '/map_screen';

  const MapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Location? _markerLocation;

  void _selectLocation(LatLng coordinates) {
    setState(() {
      _markerLocation = Location(
        latitude: coordinates.latitude,
        longitude: coordinates.longitude,
      );
    });
  }

  void _saveLocation() {
    Navigator.of(context).pop(_markerLocation);
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as MapScreenArguments;

    final mapLocation = arguments.location ?? LocationService.defaultLocation;

    return ScreenWrapper(
      showDrawer: false,
      title: "Select Location",
      actions: [
        AppBarActionButton(
          onPress: _markerLocation != null ? _saveLocation : null,
          icon: Icons.save,
        )
      ],
      addScreenPadding: false,
      child: SafeArea(
        bottom: true,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            zoom: 13,
            target: LatLng(
              mapLocation.latitude,
              mapLocation.longitude,
            ),
          ),
          onTap: _selectLocation,
          markers: _markerLocation != null
              ? {
                  Marker(
                    markerId: const MarkerId('pickedLocation'),
                    position: LatLng(
                      _markerLocation!.latitude,
                      _markerLocation!.longitude,
                    ),
                  )
                }
              : {},
        ),
      ),
    );
  }
}
