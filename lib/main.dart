import 'package:flutter/material.dart';
import "Dash.dart";
import 'CardDesign.dart';
import 'package:map_view/map_view.dart';
import "googleMap.dart";
import "details.dart";
import 'mapbox.dart';
import 'search.dart';

var KEY = 'AIzaSyDrHKl8IxB4cGXIoELXQOzzZwiH1xtsRf4';

Details d = new Details();

void main(){
  MapView.setApiKey(d.API_KEY);
  runApp(
    MaterialApp(
      home: Home(),
    )
  );
}


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}


class HomeState extends State<Home> with TickerProviderStateMixin{

  TabController _controller;
  TabController _childController;
  //Dummy Data
  List<Dash> dashList= [];
  CardDesign cd  = new CardDesign();

  var list = d.dummy;

  var title;

  setName(str){
    setState(() {
      title = str;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 4, vsync: this,initialIndex: 0);
    _childController = new TabController(length: 3, vsync: this,initialIndex: 0);
    setState(() {
      title = "Home";
    });
    _controller.addListener((){

      int index = _controller.index;
      var name = "";
      switch(index){
        case 0:{
          setName("Home");
          return;
        }
        case 1:{
          setName("Search");
          return;
        }
        case 2:{
          setName("Google Map");
          return;
        }
        case 3:{
          setName("MapBox");
          return;
        }
        default:{
          setName("Home");
            return;
        }
      };
    });

    dashList = [];
    // Generate List
    for(var i=0; i<d.dummy.length; i++){
      Dash d = new Dash();
      d.img = list[i]["img"];
      d.approved = list[i]["approved"];
      d.name = list[i]["name"];
      d.price = list[i]["price"];
      dashList.add(d);
    }
  }

  Widget bottomApppBar(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.white,
      child: TabBar(
        isScrollable: false,
          controller: _controller,
          indicatorColor: Colors.white, //Active Tab
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey[500],
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(fontSize: 7.0,),
          tabs: [
            Tab(
              icon: Icon(Icons.dashboard),
              text: "DASHBOARD",
            ),
            Tab(
              icon: Icon(Icons.search),
              text: "SEARCH",
            ),
            Tab(
              icon: Icon(Icons.map),
              text: "MAP",
            ),
            Tab(
              icon: Icon(Icons.map),
              text: "MAPBOX",
            )
          ]
      ),
    );
  }

  // Convert Text into UpperCase
  String convertUpper(str){
    return str.toUpperCase();
  }

  Widget priceRender(double price){
    var p = price.toString();
    var first = p.substring(0,p.lastIndexOf("."));
    var last = p.substring(p.lastIndexOf("."));
    print("last ${last}");
    print("First ${first}");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textBaseline: TextBaseline.ideographic,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text("₹ ${first}",style: TextStyle(color: Colors.white,fontSize: 29.0,letterSpacing: 3.0,fontWeight: FontWeight.w400)),
        Padding(
          padding: EdgeInsets.only(bottom: 2.0),
          child: Text("${last}",style: TextStyle(color: Colors.white,fontSize: 18.0,letterSpacing: 1.0,fontWeight: FontWeight.w400)),
        )
      ],
    );
  }

  TextStyle txtStly = TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: SafeArea(child: bottomApppBar()),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(title),
        leading: InkResponse(
          onTap: (){},
          child: Icon(Icons.menu),

        ),
        actions: <Widget>[
          InkResponse(
            onTap: (){},
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.search),
            )
          )
        ],
      ),
      body:TabBarView(
            physics: new NeverScrollableScrollPhysics(), // Not allow to scroll
            controller: _controller,
            children: <Widget>[

              Container(
                  decoration:  BoxDecoration(
                      color: Colors.blue,
                  ),
                  child: SafeArea(
                      child:ListView(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 15.0,),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                                  child: Container(
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius: BorderRadius.circular(50.0)
                                      ),
                                      child: TabBar(
                                          controller: _childController,
                                          indicator: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(50.0)
                                          ),
                                          labelColor: Colors.black,
                                          unselectedLabelColor: Colors.white70,
                                          labelStyle: TextStyle(fontWeight: FontWeight.w500),
                                          tabs: [
                                            Tab(
                                              text: "MONTHLY",
                                            ),
                                            Tab(
                                              text: "WEEKLY",
                                            ),
                                            Tab(
                                              text: "DAILY",
                                            )
                                          ]
                                      )
                                  )
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Text(convertUpper("Total Spendings"),style: TextStyle(color: Colors.white,fontSize: 20.0,),),
                                    SizedBox(height: 5.0,),
                                    priceRender(1245.15)
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.0,),
                              Container(
                                height: 270.0,
                                child: ListView.builder(
                                  itemBuilder: (context,index){
                                    return cd.generateCard(dashList[index]);
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: dashList.length,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                  )
              ),
              Search(),
              GoogleMap(),
              MapBox()
            ],
          ),
    );
  }
}