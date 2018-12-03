import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/login_bloc.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/login_model.dart';
import 'package:app/model/main_model.dart';


class LoginApp extends StatelessWidget {
  final MainModel mainModel;
  final AnimationController loginButtonController;
  LoginApp(this.mainModel, this.loginButtonController);

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
    Animation<double> animation = new Tween(begin: 100.0, end: 200.0).animate(
      loginButtonController
    );

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
                  child:  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                      ),
                     
                      // Notiva(),
                      // GestureDetector(
                      //   onVerticalDragUpdate: (ev) {
                      //     print(ev);

                      //   },
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width,
                      //     height: 300.0,
                      //     child: ListView.builder(
                      //       padding: EdgeInsets.all(8.0),
                      //       itemExtent: 20.0,
                      //       itemBuilder: (BuildContext context, int index) {
                      //         return Text('entry $index');
                      //       },
                      //     ),
                      //   ),
                      // ),
                      
                     
                
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

class Notiva extends StatefulWidget {
  @override
  NotivaState createState() => new NotivaState(); 

}
class NotivaState extends State<Notiva> {
  bool _onNotificationListen(ScrollNotification notif) {
    print(notif.metrics.pixels);
    print(notif.metrics.axisDirection);

    return false;
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 460.0,
      child: 
      
      NotificationListener(
        child: 
        ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemExtent: 20.0,
        itemBuilder: (BuildContext context, int index) {
          return Text('entry $index');
        },
      ),
      onNotification: _onNotificationListen,
      ),
    );
  }
}



