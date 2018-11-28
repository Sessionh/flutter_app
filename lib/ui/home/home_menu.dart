import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:app/bloc/home_bloc.dart';
import 'package:app/model/home_model.dart';



class _MenuInfo {
  final String title;
  final IconData icon;

  _MenuInfo({this.title, this.icon});
}

final List<_MenuInfo> menus = [
  _MenuInfo(title: '了解会员特权', icon: Icons.accessibility),
  _MenuInfo(title: 'QQ钱包', icon: Icons.account_balance_wallet),
  _MenuInfo(title: '个性装扮', icon: Icons.format_paint),
  _MenuInfo(title: '我的相册', icon: Icons.photo_album),
];

class DrawerPage extends StatelessWidget {
  final HomeBloc bloc;
  final HomeModel vm;

  DrawerPage(this.vm, this.bloc);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.plus,
          color: Colors.white),
      transform: 
          Matrix4.translationValues(-MediaQuery.of(context).size.width*0.8 + vm.position, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 450.0,
            // color: const Color.fromRGBO(55, 56, 79, .8),
            child: Stack(
              children: <Widget>[
                 ClipPath(
                    clipper: TriangleClipper(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 350.0,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(55, 56, 79, 1.0),
                        ),
                      ),
                  ),
                 Padding(
                   padding: EdgeInsets.only(left: 10.0, top: 100.0),
                   child: IconButton(
                     icon: Icon(Icons.brightness_4, color: Colors.white, size: 33.0,),
                     onPressed: () {

                     },
                   ),
                 ),
               
                 Padding(
                   padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.8 - 130.0, top: 110.0),
                   child: 
                      Column(
                       children: <Widget>[
                          Container(
                            width: 90.0,
                            height: 90.0,
                            margin: EdgeInsets.only(right: 30.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45.0),
                              image:  DecorationImage(image: AssetImage('images/logoUser.jpg'), fit: BoxFit.fill)

                            ),
                          ),
                          Container(
                            width: 90.0,
                            margin: EdgeInsets.only(right: 30.0, top: 10.0),
                            child: Center(
                              child: Text('Jackson', style: TextStyle(color: Colors.white, fontSize: 18.0,)),
                            ),
                          )

                       ]
                       

                     ),
                   
                 
                 ),
                
               

              ],
            ),
          )
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    
    var path = Path();
    path.lineTo(0.0, size.height - 120);

    var first = Offset(size.width / 1.2, size.height);
    var end = Offset(size.width / 1.0, size.height - 24.0);
    path.conicTo(first.dx, first.dy, end.dx, end.dy, 1.6);
    path.lineTo(size.width, size.height - 40);
    
    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}