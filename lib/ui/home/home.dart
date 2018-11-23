import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/home_bloc.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/main_model.dart';
import 'package:app/model/home_model.dart';
import 'package:flutter/rendering.dart';
import 'home_card.dart';
// import 'home_menu.dart';
// import 'package:app/common/slide_container.dart';
import 'package:app/common/sticky_header_list.dart';
import 'package:app/common/sticky_row.dart';
import 'package:sticky_headers/sticky_headers.dart';


class HomeApp extends StatelessWidget {
  final MainModel mainModel;
  final AnimationController container;
  final AnimationController container1;
  HomeApp(this.mainModel, this.container, this.container1);
  
  
  @override
  Widget build(BuildContext context) {
    final MainBloc main = BlocProvider.of<MainBloc>(context);
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    
     Animation<double> animation1 = new Tween(begin: 0.0, end: 55.0).animate(
      container
    );
     Animation<double> animation = new Tween(begin: 55.0, end: 0.0).animate(
      container
    );
     Animation<double> pageAnimation = new Tween(begin: 0.0, end:  MediaQuery.of(context).size.width - 60.0).animate(
      container1
    );
     Animation<double> pageAnimation1 = new Tween(begin: 60.0 - MediaQuery.of(context).size.width, end: 0.0 ).animate(
      container1
    );

    
    
    
   

    return StreamBuilder(
      initialData: HomeModel.initData(),
      stream: bloc.outList,
      builder: (BuildContext context2, AsyncSnapshot<HomeModel> snap){
        var vm = snap.data;


        butAnimation(animation, type, icon, color) => Center(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (type == 0) {
                    container.reverse();
                    vm.leftColor = const Color.fromRGBO(55, 56, 79, .9);
                    vm.rightColor = Colors.black38;
                    bloc.setDate(vm);
                  } else {
                    container.forward();
                    vm.leftColor = Colors.black38;
                    vm.rightColor = const Color.fromRGBO(55, 56, 79, .9);
                    bloc.setDate(vm);
                  }
                  
                },
                child: Container(
                    padding: EdgeInsets.only(top: 10.0),
                    height: 60.0,
                    width: 55.0,
                    child: Icon( icon, size: 35.0, color: color),
                ),
              ),
              Container(
                    height: 3.8,
                    width: animation.value,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2.8)),
                      color: const Color.fromRGBO(55, 56, 79, .9),
                    ),
                ),
            ],
          ),
        );
        return Scaffold(
          key: scaffoldKey,
          body:
                Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                        children: <Widget>[
                          ClipPath(
                            clipper: TriangleClipper(),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 280.0,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(55, 56, 79, 1.0),
                                ),
                              ),
                          ),
                          Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 30.0),
                                  width: MediaQuery.of(context).size.width,
                                
                                  height: 90.0,
                                  child: Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          print(333);
                                          mainModel.isLogin = false;
                                          main.setData(mainModel);

                                          // if (container1.status == AnimationStatus.dismissed) {
                                          //   container1.forward();
                                           
                                          //  container1.value = 100.0;
                                           
                                          //   vm.isModel = false;
                                          //   bloc.setDate(vm);
                                          // } else if (container1.status == AnimationStatus.completed){
                                          //   container1.reverse();
                                          // }
                                        },
                                        child:   Container(
                                          width: 40.0,
                                          height: 40.0,
                                          margin: EdgeInsets.only(left: 10.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            image:  DecorationImage(image: AssetImage('images/logoUser.jpg'), fit: BoxFit.fill)

                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width - 100,
                                        height: 40,
                                        child: Center(
                                          child: Text('APP',style: 
                                            TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0,
                                            
                                          )),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (container1.status == AnimationStatus.dismissed) {
                                            container1.forward();
                                          } else if (container1.status == AnimationStatus.completed){
                                            container1.reverse();
                                          }

                                        },
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          margin: EdgeInsets.only(right: 10.0),
                                          child: Icon(Icons.crop_free, size: 33, color: Colors.white,),
                                          
                                        ),
                                      ),
                                    
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print('点击');
                                  },
                                  child: Center(
                                    child:   Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        width: MediaQuery.of(context).size.width - 100,
                                        height: 52.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          color: Colors.white
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child:  Padding(
                                                padding: EdgeInsets.only(left: 18.0),
                                                child: Text('seach...', style: 
                                                  TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 20.0,
                                                  ),
                                                    
                                                    ),
                                                    
                                              )
                                            ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 18.0),
                                            child: Icon(Icons.search),
                                          )
                                          ],
                                        
                                        ),
                                      ),
                                  )

                                ),
                            
                                Scrollbar(
                                  child:  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height -219.0,
                                    child: NotificationListener(
                                      onNotification: (ScrollNotification notification) {
                                        if(notification is ScrollEndNotification){
                                          print(notification.metrics.extentAfter);
                                            //下滑到最底部
                                          if(notification.metrics.extentAfter == 0.0){
                                            print('底部');
                                          }
                                            //滑动到最顶部
                                          if(notification.metrics.extentBefore == 0.0){
                                            print('顶部');
                                          }
                                        }
                                        return false;

                                      },
                                      child: 
                                      
                                      // ListView.builder(itemBuilder: (context, index) {
                                      //   return new StickyHeader(
                                      //     header: new Container(
                                      //       height: 50.0,
                                      //       color: Colors.blueGrey[700],
                                      //       padding: new EdgeInsets.symmetric(horizontal: 16.0),
                                      //       alignment: Alignment.centerLeft,
                                      //       child: new Text('Header #$index',
                                      //         style: const TextStyle(color: Colors.white),
                                      //       ),
                                      //     ),
                                      //     content: new Container(
                                      //       child: new Image.network('https://imgs.qunarzz.com/p/tts8/1703/94/61eb7ce216efc702.jpg_r_390x260x90_d5dd6341.jpg', fit: BoxFit.cover,
                                      //         width: double.infinity, height: 200.0),
                                      //     ),
                                      //   );
                                      // }),

                                    StickyList.builder(
                                      builder: (BuildContext context, int index) {
                                        if (index == 0) {
                                           return new HeaderRow(
                                            child:SliverAppBar(
                                              
                                            )
                                          );

                                        } else if (index == 4){
                                           return new HeaderRow(
                                            child: Container(
                                              color: Colors.blue,
                                              height: 20.0,
                                            )
                                          );

                                        } else {
                                         return new RegularRow(
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: HomeCard(),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: HomeCard(),
                                                )

                                              ],
                                            ),

                                          );
                                       

                                        }
                                          
                                          
                                      },
                                      itemCount:5,
                                    ),

                                    )
                                    
                                  
                                ),
                                    
                                ),
                              
                              ],
                        ),
                        Positioned(
                          bottom: 0.0,
                          child:   Container(
                          height:65.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            boxShadow: <BoxShadow>[
                              new BoxShadow (
                                color: Colors.grey[300],
                                offset:   Offset.zero,
                                blurRadius: 4.0,
                              ),
                            
                            ], 
                          ),
                          child: AnimatedBuilder(
                            animation: container,
                            builder: (BuildContext context, Widget widget){
                              return Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: butAnimation(animation, 0, Icons.home, vm.leftColor)
                                ),
                                Expanded(
                                  flex: 1,
                                  child: butAnimation(animation1, 1, Icons.shopping_cart, vm.rightColor),
                                ),
                                
                              ],
                            );
                        })
                          

                        ),
                        ),


                        ],
                      ),
                  ),
                  
                  // Container(
                  //     width: MediaQuery.of(context).size.width - 60.0,
                  //     height: MediaQuery.of(context).size.height,
                  //     transform: Matrix4.translationValues(pageAnimation1.value, 0, 0),
                  //     color: Colors.white,
                  //     child: IconButton(
                  //       icon: Icon(Icons.save_alt),
                  //       onPressed: () {
                  //         print(111);
                  //         vm.isModel = true;
                  //         bloc.setDate(vm);
                  //         container1.reverse();
                  //       },
                  //     ),
                  // )
                ],
              ),
                  
            
         
          
        );

      },
    );
    
   
  }

  _buildProgressIndicator() {
  return new Padding(
    padding: const EdgeInsets.all(8.0),
    child: new Center(
      child: new Opacity(
        opacity: 1.0,
        child: new CircularProgressIndicator(),
      ),
    ),
  );
}


 
}


class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var first = Offset(size.width / 2, size.height);
    var end = Offset(size.width / 1, size.height - 20.0);
    path.conicTo(first.dx, first.dy, end.dx, end.dy, 1.6);
    path.lineTo(size.width, size.height - 40);
    
    // var firstControlPoint = Offset(size.width / 2, size.height);
    // var firstEndPoint = Offset(size.width / 1, size.height - 20.0);
    // path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //     firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}