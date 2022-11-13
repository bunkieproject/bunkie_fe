class BunkieValidators {
  static String? emailFormValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your email";
    } else if (!value.contains("@")) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  static String? usernameFormValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your username";
    } else {
      return null;
    }
  }

  static String? passwordFormValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    } else {
      return null;
    }
  }
}