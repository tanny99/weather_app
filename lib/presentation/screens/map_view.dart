import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/forecast_tile_provider.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  GoogleMapController? _controller;

  TileOverlay? _tileOverlay;

  DateTime _forecastDate = DateTime.now();

  _initTiles(DateTime date) async {
    final String overlayId = date.millisecondsSinceEpoch.toString();

    final TileOverlay tileOverlay = TileOverlay(
      tileOverlayId: TileOverlayId(overlayId),
      tileProvider: ForecastTileProvider(
        dateTime: date,
        layer: 'PR0',
        opacity: 0.4,
      ),
    );
    setState(() {
      _tileOverlay = tileOverlay;
    });
  }

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(35, -14),
    zoom: 4,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: _initialPosition,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                _controller = controller;
              });
              _initTiles(_forecastDate);
            },
            tileOverlays:
                _tileOverlay == null ? {} : <TileOverlay>{_tileOverlay!},
          ),
          Positioned(
            bottom: 30,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _forecastDate =
                              _forecastDate.subtract(const Duration(hours: 3));
                        });
                        _initTiles(_forecastDate);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Center(
                    child: Card(
                      elevation: 4,
                      shadowColor: Colors.black,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Forecast Date:\n${DateFormat('yyyy-MM-dd ha').format(_forecastDate)}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    child: ElevatedButton(
                      onPressed:
                          _forecastDate.difference(DateTime.now()).inDays >= 10
                              ? null
                              : () {
                                  setState(() {
                                    _forecastDate = _forecastDate
                                        .add(const Duration(hours: 3));
                                  });
                                  _initTiles(_forecastDate);
                                },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
