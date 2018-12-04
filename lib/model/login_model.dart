class LoginModel {
  String userName;
  String password;
  bool obscureText;
  bool isDarkTheme;

  LoginModel({
    this.userName,
    this.password,
    this.obscureText,
    this.isDarkTheme,
  });

  LoginModel.initDate({
    this.userName: '张三',
    this.password: '',
    this.obscureText: false,
    this.isDarkTheme: false,
  });
}