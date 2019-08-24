class FormValidator {
  static bool validateName(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }

  static bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    }
    // Regex for email validation
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static bool validatePassword(String value) {
    if (value.isEmpty) {
      return false;
    }
    // Use any password length of your choice here
    if (value.length < 5) {
      return false;
    }

    return true;
  }
}
