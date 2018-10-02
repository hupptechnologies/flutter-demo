import 'package:flutter/material.dart';

void main(){
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

class Dash{
  String img;
  String name;
  double price;
  bool approved;
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController _controller;

  //Dummy Data
  List<Dash> dashList= [];
  var list = [
      {
      "img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLb5mOUtzV0ObqBVuAURSvPAsC27148aFdKGc6e6Z_Z78vmMWf",
        "name":"UberRide",
        "price":152.0,
        "approved":true
      },
      {
        "img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLb5mOUtzV0ObqBVuAURSvPAsC27148aFdKGc6e6Z_Z78vmMWf",
        "name":"UberRide",
        "price":152.0,
        "approved":true
      },
      {
        "img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLb5mOUtzV0ObqBVuAURSvPAsC27148aFdKGc6e6Z_Z78vmMWf",
        "name":"UberRide",
        "price":152.0,
        "approved":true
      },
      {
        "img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLb5mOUtzV0ObqBVuAURSvPAsC27148aFdKGc6e6Z_Z78vmMWf",
        "name":"UberRide",
        "price":152.0,
        "approved":true
      },
      {
        "img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLb5mOUtzV0ObqBVuAURSvPAsC27148aFdKGc6e6Z_Z78vmMWf",
        "name":"UberRide",
        "price":152.0,
        "approved":true
      }
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 4, vsync: this,initialIndex: 0);
    dashList = [];
    for(var i=0; i<list.length; i++){
      Dash d = new Dash();
      d.img = list[i]["img"];
      d.approved = list[i]["approved"];
      d.name = list[i]["name"];
      d.price = list[i]["price"];
      dashList.add(d);
    }
    print(dashList.length);
  }

  Widget bottomApppBar(){
    return Container(
      
      color: Colors.white,
      child: TabBar(
        isScrollable: false,
          controller: _controller,
          indicatorColor: Colors.white, //Active Tab
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              icon: Icon(Icons.dashboard),
              text: "Dashboard",
            ),
            Tab(
              icon: Icon(Icons.search),
              text: "Search",
            ),
            Tab(
              icon: Icon(Icons.account_circle),
              text: "Profile",
            ),
            Tab(
              icon: Icon(Icons.notifications),
              text: "Notification",
            )
          ]
      ),
    );
  }

  Widget customAppBar(){
    return Row(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(8.0),
            child: InkResponse(
              onTap: (){
                print("menu");
              },
              child: Icon(Icons.menu),
            )
        ),
        Expanded(
          child: Text(""),
        ),
        Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(50.0)
            ),
            padding: EdgeInsets.all(8.0),
            child: InkResponse(
              onTap: (){
                print("create");
              },
              child: Icon(Icons.add),
            )
        )
      ],
    );
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: bottomApppBar(),
      body:TabBarView(
            physics: new NeverScrollableScrollPhysics(),
            controller: _controller,
            children: <Widget>[
              Container(
                  decoration:  BoxDecoration(
                      color: Colors.blue,
//                    gradient: RadialGradient(colors: [
//                      Colors.blue,
//                      Colors.yellow
//                    ])
                  ),
                  child: SafeArea(
                      child:Column(
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                            child: customAppBar()
                          ),
                          SizedBox(height: 50.0,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(50.0)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    color:Colors.red,
                                    child: Text("Monthly",style: TextStyle(
                                        color: Colors.white,
                                        decorationColor: Colors.red
                                    ),),
                                  ),
                                  Text("Weekly"),
                                  Text("Daily")
                                ],
                              ),
                            )
                          )
                        ],
                      )
                  )
              ),
              Container(
                child: Text("Seach"),
              ),
              Container(
                child: Text("Profile"),
              ),
              Container(
                child: Text("Notification"),
              )
            ],
          ),
    );
  }
}