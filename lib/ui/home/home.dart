import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/home_bloc.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/main_model.dart';
import 'package:app/model/home_model.dart';

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
                    height: 50.0,
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
            color: Colors.black26,
            child:  Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      tooltip: 'Menu Icon',
                      icon: Icon(
                          Icons.timer_off,
                          size: 18.0,
                          color: Colors.black
                      ),
                      onPressed: () {
                        mainModel.isLogin = false;
                        main.setData(mainModel);

                      },
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text('ksd${vm.type}')
                  ],
                ),
              )
            ],
           ),
          ),
          
         
          bottomNavigationBar: Container(
            height: 55.0,
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