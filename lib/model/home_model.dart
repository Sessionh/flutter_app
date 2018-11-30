import 'package:flutter/material.dart';
class HomeModel {
  String title;
  Color color;
  int type;
  Color leftColor;
  Color rightColor;
  bool isModel;
  String result;
  String customRefreshBoxIconPath;
  
  double rotationAngle;
  String customHeaderTipText;
  String defaultRefreshBoxTipText;
  List<String> strs;
  double position;
  bool isSearch; // 是否显示 搜索框
  double viewHeight; // 改变  search 高度
  
  HomeModel({
    this.title,
    this.color,
    this.type,
    this.leftColor,
    this.rightColor,
    this.isModel,
    this.result,
    this.customRefreshBoxIconPath,
    this.rotationAngle,
    this.customHeaderTipText,
    this.defaultRefreshBoxTipText,
    this.strs,
    this.position,
    this.isSearch,
    this.viewHeight,
    
  });

  HomeModel.initData({
    this.title: '',
    this.color: Colors.black,
    this.type: 0,
    this.leftColor: const Color.fromRGBO(55, 56, 79, .9),
    this.rightColor: Colors.black38,
    this.isModel: true,
    this.result: '',
    this.customRefreshBoxIconPath: 'images/icon_arrow.png',
    this.rotationAngle: 0.0,
    this.customHeaderTipText: '快尼玛给老子松手！',
    this.defaultRefreshBoxTipText: '快尼玛给老子松手！',
    this.strs: const  ["1","2","3","4","5","6","7","8","9","0"],
    this.position: 0.0,
    this.isSearch: false,
    this.viewHeight: 0.0,

  });
}