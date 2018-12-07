import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import "package:app/common/flutter_pulltorefresh/pull_to_refresh.dart";
import 'package:app/bloc/home_bloc.dart';
import 'package:app/model/home_model.dart';
import 'home_card.dart';
import 'package:app/libs/util.dart';


class HomeListView extends StatelessWidget {
  final HomeBloc bloc;
  final HomeModel model;
  final AnimationController customBoxWaitAnimation;
  final RefreshController refreshController;
  HomeListView(this.bloc, this.model, this.customBoxWaitAnimation, this.refreshController);
  
  
  @override
  Widget build(BuildContext context) {

    List<Widget> data = [];
    _getDatas() {
      for (int i = 0; i < 4; i++) {
        data.add(
          HomeCard(),
        );
      }
    }

       

    _getDatas();

    Widget _buildHeader(context,mode){
      return new ClassicIndicator(mode: mode, textStyle: TextStyle(color: Colors.white),refreshingText: '刷新',);
    }
      


    return  
      SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          enablePullUp: true,
          headerBuilder: _buildHeader,
          onRefresh: (ev) {
            print('刷新');
            if (ev) {
                Util.setTimeOut(2000, () {
                  print('测试');
                  refreshController.sendBack(true, 3);
                  return false;

              });

            }
          
            
          },
          onOffsetChange: (type, value, {id}) {
            // print(value);
            
            
         
            if (id == 2) {
              if (value >= 50.0 && value < 102.0) {
                  model.viewHeight = value - 50.0;
                  bloc.setDate(model);
              } else if (value < 50.0) {
                model.viewHeight = 0.0;
                  bloc.setDate(model);
              } else if(value > 102.0) {
                if (model.viewHeight != 52.0) {
                  model.viewHeight = 52.0;
                  bloc.setDate(model);
                }

              }
          
            } else {
              print('超出范围');
            }
          },
          child:  
          
          GridView.count(
            padding: const EdgeInsets.all(10.0),
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            children: data.toList(),
          ),
          
          // ListView(
          //   shrinkWrap: true,
          //   padding: const EdgeInsets.all(20.0),
          //   children: data,
          // ),
       
    );
    
    
  }

  

}