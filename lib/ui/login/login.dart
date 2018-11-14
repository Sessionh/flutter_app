import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/login_bloc.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/login_model.dart';
import 'package:app/model/main_model.dart';

class LoginScreen  extends StatelessWidget{
  final MainModel mainModel;
  LoginScreen({Key key, @required this.mainModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      bloc: LoginBloc(),
      child: LoginApp(mainModel)
    
    );
  }

}

class LoginApp extends StatelessWidget {
  final MainModel mainModel;
  LoginApp(this.mainModel);

  final formKey = GlobalKey<FormState>();
  void _forSubmitted() {
    var _form = formKey.currentState;
    if (_form.validate()) {
      _form.save();
    }
  }
  @override
  Widget build(BuildContext context) {
    final MainBloc main = BlocProvider.of<MainBloc>(context);
    final LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    

    return StreamBuilder(
      initialData: LoginModel.initDate(),
      stream: bloc.outList,
      builder: (BuildContext context, AsyncSnapshot<LoginModel> snap){
        var vm = snap.data;
        return Scaffold(
          body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                   decoration: new  BoxDecoration(
                    image:  DecorationImage(image: AssetImage('images/appLogo.png'), fit: BoxFit.fill),
                    ),
                  child: Column(
                    children: <Widget>[
                      
                    ],
                  ),
                ),
              )

            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              mainModel.isLogin = true;
              main.setData(mainModel);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );

      },
    );
   
  }
}


