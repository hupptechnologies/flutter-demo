import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class User{
  String username;
  double lat;
  double long;
}

var data = [{
  'lat': 40.714728,
  'long': -73.998672,
  'user_fname': 'Salesman',
  'module' : 'salesman_lst',
  'color':'black'
}];

class MapBox extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MapBoxState();
  }
}

class MapBoxState extends State<MapBox>{

  // Marker List
  List<Marker> markers = [];
  // Flag for dialog View
  bool flag = false;
  User details;

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      flag=false;
    });
    for(var i=0; i<data.length; i++){

      print(data[i]["lat"]);
      print(data[i]["long"]);
      markers.add(Marker(
          height: 35.0,
          width: 35.0,
          point: LatLng(data[i]["lat"], data[i]["long"]),
          builder: (context)=>IconButton(
            onPressed: (){
              print("tap markler");
              setState(() {
                flag = true;
                details = new User();
                details.username = data[i]["user_fname"];
                details.lat = data[i]["lat"];
                details.long = data[i]["long"];
              });
            },
            icon: Icon(Icons.location_on,color: Colors.black,size: 25.0,),
          )
      ));
      print(markers);
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FlutterMap(
          options: MapOptions(
            minZoom: 8.0,
            center: LatLng(40.714728,-73.998672),
            onTap: (latlnt){
              print("CLICK ${latlnt}");
            },
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a','b','c'],
              additionalOptions: {
                'id': 'mapbox.bright',
              },
            ),
            MarkerLayerOptions(
              markers: markers,
            )
          ],
        ),
        flag ? Container(
            padding: EdgeInsets.only(bottom: 10.0),
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100.0,
              width: 250.0,
              color: Colors.white,
              child: Text(details.username),
            )
        ) : Text("")
      ],
    );
  }
}
