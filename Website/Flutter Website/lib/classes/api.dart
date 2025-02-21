import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

String APIURL = "raasta.pythonanywhere.com";

class API {
  static Future<String> getKey() async {

    http.Response response = await http.get(Uri.https(APIURL, '/get_key'));
    var data = jsonDecode(response.body);
    var message = data["key"];
    final api_key = message;
    print(api_key);
    return api_key;
  }

  static Future<List<Map>> getPoints(String key, String type_point) async {
    http.Response data = await http.get(
        Uri.https(APIURL, '/get_points/$type_point'),
        headers: {"Authorization": key});
    var data_points = jsonDecode(data.body);
    final points = data_points["Points"];

    var y = points
        .map(
          (e) => {
            'type': type_point,
            'latlng': LatLng(e.first, e.last),
          },
        )
        .toList();
    return [
      ...y,
    ];
  }

  static Future<LatLng> getPlacePoints(place) async {
    http.Response response =
        await http.get(Uri.https(APIURL, '/get_place_coords/$place'));
    final place_info = jsonDecode(response.body);
    final place_lat = place_info['result']['geometry']['location']['lat'];
    final place_lng = place_info['result']['geometry']['location']['lng'];
    return LatLng(place_lat, place_lng);
  }

  static Future<List> getSuggestions(searchTerm, c_lat, c_lng) async {
    http.Response response = await http
        .get(Uri.https(APIURL, '/autocomplete/$searchTerm/$c_lat/$c_lng'));
    List predictions = jsonDecode(response.body);
    return predictions;
  }

  static Future<dynamic> getDirections(o_lat, o_lng, d_lat, d_lng) async {
    http.Response route = await http
        .get(Uri.https(APIURL, '/directions/$o_lat/$o_lng/$d_lat/$d_lng'));
    var data = jsonDecode(route.body);
    return data;
  }
  static Future<List<Polyline>> getVisited(String key) async {
    var headers = {'Authorization': key};
    var request = http.Request(
      'GET',
      Uri.parse('https://raasta.pythonanywhere.com/get_visited'),
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var x = jsonDecode(await response.stream.bytesToString());
      List result = x['result'];
      List<List<LatLng>> routes = result
          .map<List<LatLng>>(
            (e) => e
                .map<LatLng>(
                  (e) => LatLng(e.entries.first.value, e.entries.last.value),
                )
                .toList(),
          )
          .toList();
      int i = 0;
      return routes.map<Polyline>(
        (e) {
          i++;
          return Polyline(polylineId: PolylineId(i.toString()), width:4,points: e);
        },
      ).toList();
    } else
      throw Exception();
  }
}
