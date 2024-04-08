import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/common/api_constant.dart';

class ForecastTileProvider implements TileProvider {
  final String layer;
  final DateTime dateTime;
  int tileSize = 256;
  final double opacity;

  ForecastTileProvider({
    required this.layer,
    required this.dateTime,
    required this.opacity,
  });

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    Uint8List tileBytes = Uint8List(0);
    try {
      final date = dateTime.millisecondsSinceEpoch ~/ 1000;
      final url =
          "http://maps.openweathermap.org/maps/2.0/weather/1h/$layer/$zoom/$x/$y?appid=$open_weather_api_key";

      if (TilesCache.tiles.containsKey(url)) {
        tileBytes = TilesCache.tiles[url]!;
      } else {
        final uri = Uri.parse(url);

        final ByteData imageData = await NetworkAssetBundle(uri).load("");
        tileBytes = imageData.buffer.asUint8List();
        TilesCache.tiles[url] = tileBytes;
      }
    } catch (e) {
      print(e.toString());
    }
    return Tile(tileSize, tileSize, tileBytes);
  }
}

class TilesCache {
  static Map<String, Uint8List> tiles = {};
}
