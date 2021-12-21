import 'package:city_weather_kk/modals/weather_model.dart';
import 'package:city_weather_kk/services/data_api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<Sky> skymObject;
  final String _myCity = 'Chicago';

  @override
  void initState() {
       super.initState();
       skymObject = FreeApi().fetchForescatWithCity(myCity: _myCity);
      skymObject.then((value) => print(value)); 
      //skymObject.then((value) => print(value.main.humidity));
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
      body: ListView(
        children:<Widget>  [
          Container(
            child: FutureBuilder<Sky>(
              future: skymObject,
              builder: (context, cnapshot){
                //if(snapshot.hasData){
                  return Column(
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      DataRender(snapshot: ),
                    ],
                  );
                //}
              },
            ),
          )
        ],
      ),
    );
  }
}

class DataRender extends StatelessWidget {

  final AsyncSnapshot<Sky> snapshot;
 const DataRender({required this.snapshot});

  get skymObject => null;

  /*get skymObject => null;

  get name => null;*/

  @override
  Widget build(BuildContext context) {
    skymObject.then((value) => print(value.main.humidity));
    var city = snapshot.data;
    return Container(
      child: Column(
        children: <Widget>[
          Text('$city'),
        ],
      ),
    );
  }

}
