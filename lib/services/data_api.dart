import 'dart:convert';
import 'dart:developer';
import 'package:city_weather_kk/services/const_services.dart';
import 'package:http/http.dart' as http;

import 'package:city_weather_kk/modals/weather_model.dart';


class FreeApi {
  //get myCity => myCity ;

  //var myCity;

  Future<Sky> getAllData({required String myCity}) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    //var myCity;
    final queryParameters = {
      'q': myCity,
      'appid': ConstApi.OPENWEATHERMAP_APPID,
      'units': 'metric'
    };

    final uri = Uri.https(
        ConstApi.OPENWEATHERMAP_DOMAIN , ConstApi.OPENWEATHERMAP_SUBDOMAIN, queryParameters);
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