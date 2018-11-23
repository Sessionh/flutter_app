import 'package:app/bloc/bloc_provider.dart';
import 'package:app/model/home_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc implements BlocBase {
  PublishSubject<HomeModel> _mainController = PublishSubject<HomeModel>();

  Sink<HomeModel> get _inList => _mainController.sink;

  Stream<HomeModel> get outList => _mainController.stream;
  
  

setDate (vm) {
  HomeModel home = new HomeModel(
    title: vm.title,
    color: vm.color,
    type: vm.type, 
    leftColor: vm.leftColor, 
    rightColor: vm.rightColor,
    isModel: vm.isModel,
  );
  _inList.add(home);
}
   

  @override
  void dispose() {
    _mainController.close();
  }



  

  

  

  
}
