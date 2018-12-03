import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:app/bloc/home_bloc.dart';
import 'package:app/model/home_model.dart';
import "package:app/common/slide_container.dart";



class _MenuInfo {
  final int id;
  final String title;
  final IconData icon;
  final double top;
 

  _MenuInfo({this.title, this.icon, this.id, this.top});
}

final List<_MenuInfo> menus = [
  _MenuInfo(id: 1, title: '了解会员特权', icon: Icons.accessibility, top: 0.0),
  _MenuInfo(id: 2, title: 'QQ钱包', icon: Icons.account_balance_wallet, top: 20.0),
  _MenuInfo(id: 3, title: '个性装扮', icon: Icons.format_paint, top: 20.0),
];

class DrawerPage extends StatelessWidget {
  final HomeBloc bloc;
  final HomeModel vm;
  final GlobalKey<ContainerState> slideKey;

  DrawerPage(this.vm, this.bloc, this.slideKey);
  @override
  Widget build(BuildContext context) {

    _createTile(_MenuInfo info) =>  Padding(
                  padding: EdgeInsets.only(left: 20.0, top: info.top),
                  child: GestureDetector(
                    onTap: () {
                      print(info.id);
                    },
                    child:  Container(
                      // width: 100.0,
                      // color: Colors.green,
                      margin: EdgeInsets.only(right: 66.0),
                      child:  Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(info.icon, size: 18.0, color: Colors.grey,),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(info.title, style: TextStyle(fontSize: 18.0, color: Colors.grey),),
                          )
                        ],
                      ),
                    )
                    
                  
                  )
                  
                
                );



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
            height: MediaQuery.of(context).size.height,
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
                       slideKey.currentState.openOrClose();
                        
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

                Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 360.0),
                    child: Container(
                      child: Column(
                        children:  menus.map((menuInfo) => _createTile(menuInfo)).toList(),
                        
                      ),
                    )
                 
                ),
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - 60.0),
                  width: MediaQuery.of(context).size.width*0.8,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey[300],
                        width: 0.5,
                      )
                    )
                  ),
                  height: 60.0,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              print(666);

                            },
                            child: Wrap(
                              // spacing: 8.0, 
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 3.8),
                                  child: Icon(Icons.edit_location, color: const Color.fromRGBO(55, 56, 79, 1.0)),
                                ),
                                
                                Text('个人中心', style: TextStyle(color: Colors.grey, fontSize: 18.0),)
                                
                              ],
                            ),
                          ),
                        )
                        
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              print(6661);

                            },
                            child: Wrap(
                              spacing: 8.0, 
                              children: <Widget>[
                                 Padding(
                                  padding: EdgeInsets.only(top: 3.6),
                                  child: Icon(Icons.input, color: const Color.fromRGBO(55, 56, 79, 1.0)),
                                ),
                                Text('退出登陆', style: TextStyle(color: Colors.grey, fontSize: 18.0),)
                                
                              ],
                            ),
                          ),
                        )
                        
                      ),
                    ],
                  ),
                )
               

              ],
            ),
          ),
        
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

    // path.lineTo(0.0, size.height - 70);

    // var firstControlPoint = Offset(size.width / 4, size.height);
    // var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    // path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //     firstEndPoint.dx, firstEndPoint.dy);

    // var secondControlPoint =
    //     Offset(size.width - (size.width / 3.25), size.height - 65);
    // var secondEndPoint = Offset(size.width/ 0.799, size.height + 10.5);
    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //     secondEndPoint.dx, secondEndPoint.dy);

    // path.lineTo(size.width, size.height - 40);
    // path.lineTo(size.width, 0.0);
    
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}