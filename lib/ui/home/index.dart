import 'package:flutter/material.dart';
import 'home.dart';
import 'package:app/model/main_model.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/home_bloc.dart';
import "package:app/common/flutter_pulltorefresh/pull_to_refresh.dart";

class Home extends StatefulWidget {
  final MainModel mainModel;
  Home({Key key, @required this.mainModel}) : super(key: key);
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home>
    with TickerProviderStateMixin {
  // final MainModel mainModel;
  // HomeState({Key key, @required this.mainModel});
  AnimationController controller;
  AnimationController controller1;
  AnimationController customBoxWaitAnimation;
  RefreshController _refreshController;

  @override
  void initState() {
    
    _refreshController = new RefreshController();
    controller = new AnimationController(
        duration: new Duration(milliseconds: 150), vsync: this);
    controller1 = new AnimationController(
        duration: new Duration(milliseconds: 200), vsync: this);
     customBoxWaitAnimation=new AnimationController(duration: const Duration(milliseconds: 1000*100), vsync: this);
    
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    controller1.dispose();
    customBoxWaitAnimation.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    return BlocProvider<HomeBloc>(
      bloc: HomeBloc(),
      child: HomeApp(widget.mainModel, controller, controller1, customBoxWaitAnimation, _refreshController),
    );
  }
}
