import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";
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
              Row(
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
        }

       

        _getDatas();

         Widget _buildHeader(context,mode){
          return new ClassicIndicator(mode: mode, textStyle: TextStyle(color: Colors.white),refreshingText: '刷新',);
        }
        


    return new  SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          enablePullUp: true,
          headerBuilder: _buildHeader,
          onRefresh: (ev) {
            print('刷新');
            if (ev) {
                Util.setTimeOut(2, () {
                  print('测试');
                  refreshController.sendBack(true, 3);
                  return false;

              });

            }
          
            
          },
          onOffsetChange: (type, value) {
            print('超出范围');
          },
          child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: data,
        ),
       
      );
  }

  

}