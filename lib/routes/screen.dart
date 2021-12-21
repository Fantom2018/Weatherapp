import 'package:city_weather_kk/modals/weather_model.dart';
import 'package:city_weather_kk/services/data_api.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);
  final String _myCity = 'Chicago';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF04392F),
        title: const Text('Weather on City'),
        centerTitle: true,
      ),
      body: FutureBuilder<Sky>(
        //future: FreeApi.getAllData(myCity: _myCity),
        builder: (context,snapshot){
          final info = snapshot.data;
          switch (snapshot.connectionState){
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:

          }
        },
      ),

    );
  }
}
