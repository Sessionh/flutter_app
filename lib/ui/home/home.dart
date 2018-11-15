import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/home_bloc.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/main_model.dart';
import 'package:app/model/home_model.dart';
import 'home_card.dart';

class HomeApp extends StatelessWidget {
  final MainModel mainModel;
  final AnimationController container;
  HomeApp(this.mainModel, this.container);
  
  
  @override
  Widget build(BuildContext context) {
    final MainBloc main = BlocProvider.of<MainBloc>(context);
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
 
    container.addListener((){

    });
     Animation<double> animation1 = new Tween(begin: 0.0, end: 55.0).animate(
      container
    );
     Animation<double> animation = new Tween(begin: 55.0, end: 0.0).animate(
      container
    );
    ScrollController _scrollController = new ScrollController();
    _scrollController.addListener(() {
      print('底部');

    });

    return StreamBuilder(
      initialData: HomeModel.initData(),
      stream: bloc.outList,
      builder: (BuildContext context, AsyncSnapshot<HomeModel> snap){
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
          body: Container(
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFe0f0e9),
            child:  Stack(
              children: <Widget>[
                 Container(
                  width: MediaQuery.of(context).size.width,
                  height: 280.0,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(55, 56, 79, .9),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(310.0, 50.0),
                      bottomRight: Radius.elliptical(310.0, 50.0)
                    )
                  
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
                          Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image:  DecorationImage(image: AssetImage('images/logoUser.jpg'), fit: BoxFit.fill)

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
                                        fontSize: 20.0,
                                        
                                      )),
                            ),
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.only(right: 10.0),
                            child: Icon(Icons.crop_free, size: 33, color: Colors.white,),
                            
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height -219.0,
                      child:  ListView.builder(
                        itemCount: 3,
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          return     Row(
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
                          );
                        },
                      ),
                      
                    ),

                      
                   
                  ],
              ),

              ],
            )
            
            
          ),
         
          bottomNavigationBar: Container(
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
          
        );

      },
    );
    
   
  }

 
}