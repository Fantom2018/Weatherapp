import 'package:city_weather_kk/modals/weather_model.dart';
import 'package:city_weather_kk/services/data_api.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<Sky> skymObject;
  final String _myCity = 'Chicago';

  @override
  void initState() {
       super.initState();
       skymObject = FreeApi().getAllData (myCity: _myCity);
      //skymObject.then((value) => print(value.main.temp));
      //skymObject.then((value) => print(value.main.humidity));
      //skymObject.then((value) => print(value.weather[0].icon));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

     appBar: AppBar(
        backgroundColor: const Color(0xFF04392F),
        title: const Text('Weather on City'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFFFAFA),
      body: Column(
        children:<Widget>[
          Flexible(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
                children:<Widget>  [
                   FutureBuilder<Sky>(
                    future: skymObject,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text('data');
                    }else
                      return Column(
                        children: <Widget>[

                          const SizedBox(height: 30.0),
                          DataRender(snapshot: snapshot),
                        ],
                      );
                    })


        ],
      ),
          ),]

    ));
  }
}

class DataRender extends StatelessWidget {
  final AsyncSnapshot<Sky> snapshot;
   const DataRender({required this.snapshot});
  @override
  Widget build(BuildContext context) {


    late var temper = snapshot.data!.main.temp;
    late var cityname = snapshot.data!.name;
    late var cauntr = snapshot.data!.sys!.country;
    late var humidit = snapshot.data!.main.humidity;
    late var aswind = snapshot.data!.wind.speed;
    late var pic = snapshot.data!.weather[0].icon;
    late var descr = snapshot.data!.weather[0].description;
  return
    Column(
      children: <Widget>[
        Text("$cityname"),
        Text('$cauntr'),
        Text('$temper'),
        Text('$humidit'),
        Text('$aswind'),
        Text('$pic'),
        Text('$descr'),


      ],
    );
  }

}
