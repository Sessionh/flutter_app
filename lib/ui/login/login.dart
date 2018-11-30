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
                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 300.0,
                      //   color: Colors.white,
                      //   child: AnimatedListSample(),
                      // ),
                      // AnimatedListSample()
                     
                
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


class AnimatedListSample extends StatefulWidget {
  @override
  _AnimatedListSampleState createState() => new _AnimatedListSampleState();
}

class _AnimatedListSampleState extends State<AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey = new GlobalKey<AnimatedListState>();
  ListModel<int> _list;
  int _selectedItem;
  int _nextItem; // The next item inserted when the user presses the '+' button.

  @override
  void initState() {
    super.initState();
    _list = new ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  // Used to build an item after it has been removed from the list. This method is
  // needed because a removed item remains  visible until its animation has
  // completed (even though it's gone as far this ListModel is concerned).
  // The widget will be used by the [AnimatedListState.removeItem] method's
  // [AnimatedListRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(int item, BuildContext context, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: item,
      selected: false,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  // Insert the "next item" into the list model.
  void _insert() {
    final int index = _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
    _list.insert(index, _nextItem++);
  }

  // Remove the selected item from the list model.
  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  
       Container(
        width: MediaQuery.of(context).size.width,
        height: 300.0,
        color: Colors.white,
        child: Column(
          children: <Widget>[
              AnimatedList(
                key: _listKey,
                initialItemCount: _list.length,
                itemBuilder: _buildItem,
              ),
               IconButton(
                icon: Icon(Icons.backup),
                onPressed: () {
                  print(324);
                  _insert();
                 
                },
              ),
          ],
        ),
      );
    
   
    
    
  }
}


class ListModel<E> {
  ListModel({
    @required this.listKey,
    @required this.removedItemBuilder,
    Iterable<E> initialItems,
  }) : assert(listKey != null),
       assert(removedItemBuilder != null),
       _items = new List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(index, (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }

  int get length => _items.length;
  E operator [](int index) => _items[index];
  int indexOf(E item) => _items.indexOf(item);
}


class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
    @required this.animation,
    this.onTap,
    @required this.item,
    this.selected: false
  }) : assert(animation != null),
       assert(item != null && item >= 0),
       assert(selected != null),
       super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return new Padding(
      padding: const EdgeInsets.all(2.0),
      child: new SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: new SizedBox(
            height: 68.0,
            child: new Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: new Center(
                child: new Text('Item $item', style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


