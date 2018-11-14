import 'package:flutter/material.dart';
class HomeModel {
  String title;
  Color color;
  int type;
  Color leftColor;
  Color rightColor;
  HomeModel({
    this.title,
    this.color,
    this.type,
    this.leftColor,
    this.rightColor,
  });

  HomeModel.initData({
    this.title: '',
    this.color: Colors.black,
    this.type: 0,
    this.leftColor: const Color.fromRGBO(55, 56, 79, .9),
    this.rightColor: Colors.black38,
  });
}