class Utils{
  bool isValidEmail(String email) {
    String pattern =
        r"^(?:\d{10}|\w+@\w+\.\w{2,3})$";
    RegExp regex = RegExp(pattern);
    print(regex.hasMatch(email));
    return regex.hasMatch(email);
  }

  bool isPasswordEmail(String password) {
    String pattern =
        r"^(?=.*?[A-Z[a-z][0-9]])(?=.*?[!@#\$&*~]).{6,}$";
    RegExp regex = RegExp(pattern);
    print(regex.hasMatch(password));
    return regex.hasMatch(password);
  }
}