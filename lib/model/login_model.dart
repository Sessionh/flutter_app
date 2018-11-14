class LoginModel {
  String userName;
  String password;

  LoginModel({
    this.userName,
    this.password,
  });

  LoginModel.initDate({
    this.userName: '张三',
    this.password: '',
  });
}