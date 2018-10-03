import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'dart:async';

var KEY = 'AIzaSyDrHKl8IxB4cGXIoELXQOzzZwiH1xtsRf4';

class GoogleMap extends StatefulWidget{
  createState()=> GoogleMapState();
}

class GoogleMapState extends State<GoogleMap>{

  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var staticMapProvider = new StaticMapProvider(KEY);
  Uri staticMapUri;
  List<Marker> markers = <Marker>[];

  showMap()  {
    print(markers);
    mapView.show(new MapOptions(
      mapViewType: MapViewType.normal,
      initialCameraPosition:
      new CameraPosition(new Location(23.023303, 72.5682), 15.0),
      showUserLocation: true,
      showMyLocationButton: true,
      title: "Map",
    ),
      toolbarActions: <ToolbarAction>[new ToolbarAction("Close", 1)],
    );

    mapView.onMapReady.listen((data){
      setState(() {
        markers.length>0 ?  mapView.setMarkers(markers) : '';
        mapView.zoomToFit(padding: 100);
      });
    });

    mapView.onMapTapped.listen((data){
      var id,tmp;
      id= markers.length;
      if(id > 0){
        tmp = (int.parse(markers[id-1].id)+1).toString();
      }else{
        tmp = "1";
      }
      Color colorName = (int.parse(tmp)%2 == 0) ? Colors.green : Colors.orangeAccent;
      markers.add(Marker(tmp, tmp, data.latitude, data.longitude,draggable: true,color: colorName));
      mapView.addMarker(Marker(tmp, tmp, data.latitude, data.longitude,draggable: true,color: colorName));
    });

    mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        mapView.dismiss();
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cameraPosition = new CameraPosition(Locations.portland, 2.0);
    staticMapUri = staticMapProvider.getStaticUri(
      new Location(23.023303, 72.5682), 15,
      width: 900,
      height: 300,
      mapType: StaticMapViewType.roadmap
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: RaisedButton(
                onPressed:showMap,
                child: Text("Map"),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder:(context,index){
                  return Card(
                    child: Image.network(staticMapUri.toString()),
                  );
                },
                itemCount: 1,
              ),
            )
          ],
    );
  }
}