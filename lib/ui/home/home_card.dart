import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: (MediaQuery.of(context).size.width -60)/ 2,
      height: 230,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0))
      ),
      child: Column(
        children: <Widget>[
          Text('测试')

        ],
      ),

    );
  }
  
}