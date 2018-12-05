import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget{
  final Function resultClick;
  final String title;
  LoginButton(this.resultClick, this.title);
  LoginButtonApp createState() => new LoginButtonApp();
}

class LoginButtonApp extends State<LoginButton> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width*0.8,
      child: RaisedButton(
        padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
        color: Color.fromRGBO(0, 157, 178, .8),
        onPressed: () {
         
          // bloc.forSubmitted(formKey);
          // print(vm.userName);
          // print(MediaQuery.of(context).viewInsets.bottom);
          widget.resultClick();
          
        },
        child: Center(
          child: Text('登陆', style: TextStyle(
            fontSize: 20.0,
            color: Colors.white
          ),),
        ),
      )
    );
  }

}