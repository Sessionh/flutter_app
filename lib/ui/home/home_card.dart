import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      width: (MediaQuery.of(context).size.width - 40)/ 2,
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0))
      ),
      child: Column(
        children: <Widget>[
          Text('新疆西红柿',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,

            ),
          ),
          Image.asset('images/Green_Grapes.png',height: 150.0,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: <Widget>[
                    
                       Icon(Icons.star, size: 16.0, color: Colors.orange),
                       Text('3.0')
                    ]
                   
                    
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text('3.7km',style: TextStyle(color: Colors.grey),),
              )
            ],
          ),
            Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text('￥32'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0, top: 5.0),
                child: Text('月售66', style: TextStyle(color: Colors.grey, fontSize: 13.0),),
              )
            ],
          ),
       

        ],
      ),

    );
  }
  
}