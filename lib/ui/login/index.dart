import 'package:flutter/material.dart';
import 'login.dart';
import 'package:app/model/main_model.dart';

class Login extends StatefulWidget {
  final MainModel mainModel;
  Login({Key key, @required this.mainModel}) : super(key: key);
  @override
  LoginScreenState createState() => new LoginScreenState(mainModel: mainModel);
}

class LoginScreenState extends State<Login>
    with TickerProviderStateMixin {
  final MainModel mainModel;
  LoginScreenState({Key key, @required this.mainModel});
  AnimationController _loginButtonController;
  var animationStatus = 0;
  @override
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return LoginScreen(mainModel: mainModel);
  }
}
