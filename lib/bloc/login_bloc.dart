import 'package:app/bloc/bloc_provider.dart';
import 'package:app/model/login_model.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc implements BlocBase {
  PublishSubject<LoginModel> _mainController = PublishSubject<LoginModel>();

  Sink<LoginModel> get _inList => _mainController.sink;
  
  Stream<LoginModel> get outList => _mainController.stream;
  
  

   

  @override
  void dispose() {
    _mainController.close();
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
