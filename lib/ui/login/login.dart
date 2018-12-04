import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/login_bloc.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/login_model.dart';
import 'package:app/model/main_model.dart';
import 'login_form.dart';
import 'package:app/common/bottomText.dart';


class LoginApp extends StatelessWidget {
  final MainModel mainModel;
  final AnimationController loginButtonController;
  LoginApp(this.mainModel, this.loginButtonController);

  
  @override
  Widget build(BuildContext context) {
    final MainBloc main = BlocProvider.of<MainBloc>(context);
    final LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    Animation<double> animation = new Tween(begin: 100.0, end: 200.0).animate(
      loginButtonController
    );
    final formKey = GlobalKey<FormState>();
    
  

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
                    // image:  DecorationImage(image: AssetImage('images/appLogo.png'), fit: BoxFit.fill),
                    ),
                  child:  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 100.0, bottom: 16.0),
                        child:  Image.asset(
                          'images/logoUser.png',
                          height: 86.0,
                          width: 86.0,
                        ),
                      ),
                      // LoginForm(),
                     
                   
                      Form(
                        key: formKey,
                        child: Container(
                          // height: 300.0,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[

                              Row(
                                  children: <Widget>[
                                    new Container(
                                    child: new Icon(Icons.person, color: Colors.black54),
                                    width: 60.0,
                                  ),
                                  new Expanded(
                                    child: 
                                    TextFormField(
                                        decoration: InputDecoration(labelText: '用户名', border: InputBorder.none),
                                        // obscureText: false,
                                        onSaved: (val) {

                                        },
                                        // keyboardType: TextInputType.text,
                                        // autocorrect: false,
                                        // enabled: true, //是否允许用户输入
                                        style: TextStyle(
                                            color: 
                                                  Colors.black),
                                      ),
                                  )

                                  ]
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 25.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 0.3, color: Colors.lightBlue.shade900),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    new Container(
                                      child: new Icon(Icons.https, color: Colors.black54),
                                      width: 60.0,
                                    ),
                                    new Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: '密码',
                                          border: InputBorder.none
                                        ),
                                        focusNode:FocusNode(),
                                        onSaved: (val) {                             
                                            vm.password = val;
                                        },
                                        keyboardType: TextInputType.text,
                                        autocorrect: false,
                                        obscureText:  vm.obscureText, // 是否可见
                                        style: TextStyle(
                                            color: vm.isDarkTheme
                                                ? Colors.white
                                                : Colors.black
                                        ),
                                      ),
                                    ),
                                    new Container(
                                      child: new IconButton(
                                        icon: bloc.iconType(0),
                                        onPressed: () {

                                        },

                                      ),
                                      
                                      width: 60.0,
                                    ),

                                  ]
                                ),
                                 Container(
                                  margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 35.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 0.3, color: Colors.lightBlue.shade900),
                                    ),
                                  ),
                                ),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        child: RaisedButton(
                          padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                          color: Color.fromRGBO(0, 157, 178, .8),
                          onPressed: () {
                            mainModel.isLogin = true;
                            main.setData(mainModel);
                          },
                          child: Center(
                            child: Text('登陆', style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                            ),),
                          ),
                        )
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 80.0,
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1, top: 10.0),
                              child:   ButtomText(text: '忘记密码？',),
                            ),
                          ),
                        
                          Padding(
                            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.1, top: 10.0),
                            child: ButtomText(text: '注册账户',textColor: Colors.blue,),
                          )
                          
                        ],
                      )
                      

                     
                     
                
                    ],
                  ),
                ),
              )

            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
            
          //   },
          //   tooltip: 'Increment',
          //   child: Icon(Icons.add),
          // ),
        );

      },
    );
   
  }
}




