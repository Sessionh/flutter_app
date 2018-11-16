import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      width: (MediaQuery.of(context).size.width -60)/ 2,
      height: 230,
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
          
       

        ],
      ),

    );
  }
  
}