class LoginModel {
  String userName;
  String password;
  bool obscureText;
  bool isDarkTheme;
  bool isButtonShow;

  LoginModel({
    this.userName,
    this.password,
    this.obscureText,
    this.isDarkTheme,
    this.isButtonShow,
  });

  LoginModel.initDate({
    this.userName: '张三',
    this.password: '',
    this.obscureText: true,
    this.isDarkTheme: false,
    this.isButtonShow: false,
  });
}