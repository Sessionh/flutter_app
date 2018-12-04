import 'package:app/bloc/bloc_provider.dart';
import 'package:app/model/login_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class LoginBloc implements BlocBase {
  PublishSubject<LoginModel> _mainController = PublishSubject<LoginModel>();

  Sink<LoginModel> get _inList => _mainController.sink;
  
  Stream<LoginModel> get outList => _mainController.stream;
  
  

   

  @override
  void dispose() {
    _mainController.close();
  }
  Icon iconType (int iconTypePassword) {
      if (iconTypePassword == 0) {
        return Icon(Icons.visibility_off,color: Colors.black54);
      } else {
        return Icon(Icons.remove_red_eye,color: Colors.black54);
      }
      
  }

  setDate (vm) {
    LoginModel login = new LoginModel(userName: vm.userName, password: vm.password);
    _inList.add(login);

  }



  // 模拟网络返回JSON字符串
  Future<String> getProduct() async {
    print("Started getting product");
    await Future.delayed(Duration(seconds: 2));
    print("Finished getting product");
    return '{"name": "Flux compensator", "price": 99999.99}';
  }



  

  

  

  
}
