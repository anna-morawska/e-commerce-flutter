import 'package:ecommerce_app/models/location.dart';
import 'package:ecommerce_app/screens/map/map_screen.dart';
import 'package:ecommerce_app/services/location_service.dart';
import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? mapSnapshotUrl;

  void _getUserLocation() async {
    final url = await LocationService.getMapSnapshotUrl();
    setState(() {
      mapSnapshotUrl = url;
    });
  }

  void _navigateToMapScreen() async {
    final location = await LocationService.getUserLocation();

    final pickedLocation = await Navigator.of(context).pushNamed(
      MapScreen.routeName,
      arguments: MapScreenArguments(location: location),
    ) as Location?;

    if (pickedLocation != null) {
      final url = await LocationService.getMapSnapshotUrl(
        lat: pickedLocation.latitude,
        long: pickedLocation.longitude,
      );

      setState(() {
        mapSnapshotUrl = url;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                width: 2,
                color: ThemeColors.backgroundPaper,
              ),
            ),
            child: mapSnapshotUrl != null && mapSnapshotUrl != ""
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      mapSnapshotUrl!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                  )
                : const Center(
                    child: Icon(
                      Icons.map,
                      size: 80,
                      color: ThemeColors.backgroundPaper,
                    ),
                  ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Button(
                  "Your Location",
                  onPress: _getUserLocation,
                  buttonType: ButtonType.outlined,
                  buttonSize: ButtonSize.small,
                  icon: Icons.location_pin,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Button(
                  "Map",
                  onPress: _navigateToMapScreen,
                  buttonType: ButtonType.outlined,
                  buttonSize: ButtonSize.small,
                  icon: Icons.map,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
