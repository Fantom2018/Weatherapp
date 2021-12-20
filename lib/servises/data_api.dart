import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:city_weather_kk/modals/weather_model.dart';


class FreeApi {
  Future<Sky> fetchForescatWithCity({required String city}) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': 'London',
      'appid': 'mmmm',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    log('request: ${uri.toString()}');

    final response = await http.get(uri);
    //print('response: ${response.body}');

    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      return Sky.fromJson(json);

    }else{
      throw Exception('Error data from site');
    }

  }
}