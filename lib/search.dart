import 'package:flutter/material.dart';


class Search extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
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
    );
  }
}