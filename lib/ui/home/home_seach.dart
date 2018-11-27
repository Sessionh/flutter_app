import 'package:flutter/material.dart';
import 'package:app/bloc/home_bloc.dart';
import 'package:app/model/home_model.dart';


class HomeSeach extends StatelessWidget {
  final HomeBloc bloc;
  final HomeModel model;
  HomeSeach(this.bloc, this.model);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('搜索');
          model.title = '测试';
          List<String> list = [];
          list.addAll(model.strs);
          list.add('a');
          model.strs = list;
          bloc.setDate(model);
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
                      child: Text('seach...${model.title}', style: 
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

      );
  }
}