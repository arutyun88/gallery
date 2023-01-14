abstract class AppRegExp {
  static const String email =
      r"^[a-zA-Zа-яА-Я0-9.a-zA-Zа-яА-Я0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Zа-яА-Я0-9]+\.[a-zA-Zа-яА-Я]+";
  static const String password =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#*/|\\%+=<>]).{8,}$';
}

extension StringX on String {
  bool validatePassword() => RegExp(AppRegExp.password).hasMatch(this);
}

extension EmailValidate on String {
  bool validateEmail() => RegExp(AppRegExp.email).hasMatch(this);
}
