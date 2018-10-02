import 'package:flutter/material.dart';
import 'Dash.dart';

class  CardDesign{
  // Create Button with OutLine
  Widget statusButton(flag){
    return OutlineButton(
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),),
      disabledBorderColor: flag ? Colors.green : Colors.orangeAccent,
      onPressed: null,
      disabledTextColor: flag ? Colors.green : Colors.orangeAccent,
      child: new Text(flag ? "Approved" :  "Pending"),
    );
  }


  Widget generateCard(Dash dashlist){
    return Padding(
        padding: EdgeInsets.all(10.0),
        child:Container(
            decoration:BoxDecoration(
                color:  Colors.grey[100].withOpacity(0.9),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0
                  )
                ]
            ),
            width: 170.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: new BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: new DecorationImage(
                      image: new NetworkImage(dashlist.img),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 5.0
                      )
                    ]
                  ),
                ),
                SizedBox(height: 5.0,),
                Text("${dashlist.name}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.0),),
                Container(
                  child: Text("JULY 06,2018"),
                  padding: EdgeInsets.all(5.0),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: 5.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                        color:Colors.grey[400],
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                  ),
                ),
                Container(
                  child: Text("₹ ${dashlist.price}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20.0),),
                ),
                SizedBox(
                    height: 10.0
                ),
                SizedBox(
                  height: 25.0,
                  child: statusButton(dashlist.approved),
                )
              ],
            )
        )
    );
  }
}