import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/main_model.dart';
import 'package:app/ui/home/index.dart';
import 'package:app/ui/login/index.dart';
import 'package:app/ui/user/user.dart';
void main() {
  runApp(BlocProvider<MainBloc>(
    bloc: MainBloc(),
    child: MyApp(),
  )
    
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter bloc',
      home: StreamBuilder(
        stream: bloc.outList,
        initialData: MainModel.initData(),
        builder: (BuildContext context, AsyncSnapshot<MainModel> snapshot) {
          var result = snapshot.data;
          return result.isLogin ? Home(mainModel: result) : Login(mainModel: result);
        }

      )
      
    );
  }
}




