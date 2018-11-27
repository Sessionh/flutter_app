import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/login_bloc.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/login_model.dart';
import 'package:app/model/main_model.dart';
import 'dart:async';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'dart:async';
import 'dart:convert' show json;
import 'package:http/http.dart' as HTTP;

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
              // new StickyList(
              //   children: <StickyListRow>[
              //     new HeaderRow(child: Text('333')),
              //     new RegularRow(child: Text('33344')),
              //     new RegularRow(child: Text('333555')),
              //     new HeaderRow(child: Text('3335566')),
              //     new RegularRow(child: Text('33377')),
              //   ],
              // ),
              
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                   decoration: new  BoxDecoration(
                    image:  DecorationImage(image: AssetImage('images/appLogo.png'), fit: BoxFit.fill),
                    ),
                  child:  Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 100.0),),
                      Container(
                        width: animation.value,
                        height: 200.0,
                        color: Colors.green,
                      ),
                      IconButton(
                          icon: Icon(Icons.backup),
                          onPressed: () {
                            print(324);
                            // loginButtonController.value = 150.0;

                            // loginButtonController.forward();
                            // loginButtonController.reverse();
                          },
                        ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300.0,
                        child: Example2(),
                      )
                     
                    
               
                
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




// class Example1 extends StatefulWidget {
//   @override
//   _Example1State createState() => new _Example1State();
// }

// class _Example1State extends State<Example1> {
// //  RefreshMode  refreshing = RefreshMode.idle;
// //  LoadMode loading = LoadMode.idle;
//   RefreshController _refreshController;
//   List<Widget> data = [];
//   void _getDatas() {
//     for (int i = 0; i < 14; i++) {
//       data.add(new Card(
//         margin:
//             new EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
//         child: new Center(
//           child: new Text('Data $i'),
//         ),
//       ));
//     }
//   }

//   void enterRefresh() {
//     _refreshController.requestRefresh(true);
//   }

//   void _onOffsetCallback(bool isUp, double offset) {
//     // if you want change some widgets state ,you should rewrite the callback
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     _getDatas();
//     _refreshController = new RefreshController();
//     super.initState();
//   }

//   Widget _headerCreate(BuildContext context, int mode) {
//     return new ClassicIndicator(
//       mode: mode,
//       refreshingText: "",
//       idleIcon: new Container(),
//       idleText: "Load more...",
//     );
//   }

// //  Widget _footerCreate(BuildContext context,int mode){
// //    return new ClassicIndicator(mode: mode);
// //  }

//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//         child: new SmartRefresher(
//             enablePullDown: true,
//             enablePullUp: true,
//             controller: _refreshController,
//             onRefresh: (up) {
//               if (up)
//                 new Future.delayed(const Duration(milliseconds: 2009))
//                     .then((val) {
//                   data.add(new Card(
//                     margin: new EdgeInsets.only(
//                         left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
//                     child: new Center(
//                       child: new Text('Data '),
//                     ),
//                   ));

//                   _refreshController.scrollTo(_refreshController.scrollController.offset+100.0);
//                   _refreshController.sendBack(true, RefreshStatus.idle);
//                   setState(() {});
// //                refresher.sendStatus(RefreshStatus.completed);
//                 });
//               else {
//                 new Future.delayed(const Duration(milliseconds: 2009))
//                     .then((val) {
//                   data.add(new Card(
//                     margin: new EdgeInsets.only(
//                         left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
//                     child: new Center(
//                       child: new Text('Data '),
//                     ),
//                   ));
//                   setState(() {});
//                   _refreshController.sendBack(false, RefreshStatus.idle);
//                 });
//               }
//             },
//             onOffsetChange: _onOffsetCallback,
//             child: new ListView.builder(
//               reverse: true,
//               itemExtent: 100.0,
//               itemCount: data.length,
//               itemBuilder: (context, index) => new Item(),
//             )));
//   }
// }

// class Item extends StatefulWidget {
//   @override
//   _ItemState createState() => new _ItemState();
// }

// class _ItemState extends State<Item> {
//   @override
//   Widget build(BuildContext context) {
//     return new Card(
//       margin:
//           new EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
//       child: new Center(
//         child: new Text('Data'),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     print("销毁");
//     super.dispose();
//   }
// }


class Example2 extends StatefulWidget {
  @override
  _Example2State createState() => new _Example2State();
}

class _Example2State extends State<Example2> with TickerProviderStateMixin {
  RefreshController _controller;
  int indexPage = 2;
  List<String> data = [];

  void _fetch() {
    HTTP
        .get(
            'http://image.baidu.com/channel/listjson?pn=$indexPage&rn=30&tag1=%E6%98%8E%E6%98%9F&tag2=%E5%85%A8%E9%83%A8&ie=utf8')
        .then((HTTP.Response response) {
      Map map = json.decode(response.body);

      return map["data"];
    }).then((array) {
      for (var item in array) {
        data.add(item["image_url"]);
      }
      setState(() {});
      _controller.sendBack(false, RefreshStatus.idle);
      indexPage++;
    }).catchError(() {
      _controller.sendBack(false, RefreshStatus.failed);
    });
  }

  void _onRefresh(bool up) {
    if (up)
      new Future.delayed(const Duration(milliseconds: 2009)).then((val) {
        _controller.sendBack(true, RefreshStatus.completed);
//                refresher.sendStatus(RefreshStatus.completed);
      });
    else {
      print("sd");
      new Future.delayed(const Duration(milliseconds: 2009)).then((val) {
        _fetch();
      });
    }
  }

  Widget buildImage(context, index) {
    return new Item(
      url: data[index],
    );
  }

  void _onOffsetCallback(bool isUp, double offset) {
    // if you want change some widgets state ,you should rewrite the callback
    if (isUp) {
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new RefreshController();
  }

  Widget _headerCreate(BuildContext context, int mode) {
    return new ClassicIndicator(mode: mode);
  }

  Widget _footerCreate(BuildContext context, int mode) {
    return new ClassicIndicator(
      mode: mode,
      refreshingText: 'loading...',
      idleIcon: const Icon(Icons.arrow_upward),
      idleText: 'Loadmore...',
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: _controller,
      onRefresh: _onRefresh,
      headerBuilder: _headerCreate,
      footerBuilder: _footerCreate,
      footerConfig: new RefreshConfig(),
      onOffsetChange: _onOffsetCallback,
      child: new GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: data.length,
        itemBuilder: buildImage,
      ),
    );
  }
}

class Item extends StatefulWidget {
  final String url;

  Item({this.url});

  @override
  _ItemState createState() => new _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    if (widget.url == null) return new Container();
    return new RepaintBoundary(
      child: new Image.network(
        widget.url,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("销毁");
    super.dispose();
  }
}