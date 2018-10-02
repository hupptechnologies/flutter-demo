import 'package:flutter/material.dart';
import "Dash.dart";
import 'CardDesign.dart';

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


class HomeState extends State<Home> with TickerProviderStateMixin{

  TabController _controller;
  TabController _childController;
  //Dummy Data
  List<Dash> dashList= [];
  CardDesign cd  = new CardDesign();

  var list = [
      {
      "img":"https://cdn.geekwire.com/wp-content/uploads/2016/07/uber_shutterstock_326732741-630x420.jpg",
        "name":"Uber Ride",
        "price":650.0,
        "approved":true
      },
      {
        "img":"https://ssmscdn.yp.ca/image/resize/bd725768-7ced-4803-a197-b606ae9bedf7/ypui-d-mp-pic-gal-lg/starbucks-other-10.jpg",
        "name":"Starbucks",
        "price":434.0,
        "approved":false
      },
      {
        "img":"https://audimediacenter-a.akamaihd.net/system/production/media/63323/images/9287124de49431059fcf4d5f8ccca35aa3681434/A186768_overfull.jpg?1529417131",
        "name":"Audi Ride",
        "price":25.0,
        "approved":false
      },
      {
        "img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9Sw-7YciVOwp-HPt0_tsxxCCav6GQRX7MKz3QL8706IeDBNpO",
        "name":"Flutter",
        "price":152.0,
        "approved":true
      },
      {
        "img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLb5mOUtzV0ObqBVuAURSvPAsC27148aFdKGc6e6Z_Z78vmMWf",
        "name":"Uber Ride",
        "price":152.0,
        "approved":false
      },
      {
        "img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9Sw-7YciVOwp-HPt0_tsxxCCav6GQRX7MKz3QL8706IeDBNpO",
        "name":"Flutter",
        "price":152.0,
        "approved":true
      },
      {
        "img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLb5mOUtzV0ObqBVuAURSvPAsC27148aFdKGc6e6Z_Z78vmMWf",
        "name":"Uber Ride",
        "price":152.0,
        "approved":false
      }
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 4, vsync: this,initialIndex: 0);
    _childController = new TabController(length: 3, vsync: this,initialIndex: 0);
    dashList = [];
    // Generate List
    for(var i=0; i<list.length; i++){
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

      color: Colors.white,
      child: TabBar(
        isScrollable: false,
          controller: _controller,
          indicatorColor: Colors.white, //Active Tab
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey[500],
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(fontSize: 12.0,),

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
            physics: new NeverScrollableScrollPhysics(),
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
              SafeArea(
                child: Center(
                  child:new Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: new DecorationImage(
                        image: new NetworkImage('https://ssmscdn.yp.ca/image/resize/bd725768-7ced-4803-a197-b606ae9bedf7/ypui-d-mp-pic-gal-lg/starbucks-other-10.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                    ),
                  ),
                ),
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