class Validations {
  String validateEmail(val) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    if (!regExp.hasMatch(val)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  String validatePassword(val) {
    if (val.length < 6) {
      return 'Password must be at least 6 chars long';
    } else if (val.length > 20) {
      return 'Password must be between 6 & 20 chars long';
    }

    return null;
  }

  String validatefullName(val) {
    // TODO: VALIDATE IT TO TWO SEPERATE WORDS
    if (val.length > 30) {
      return 'Name shouldn\'t be more than 30 chars long';
    } else if (val.length < 1) {
      return 'You must enter your full name';
    }

    return null;
  }

  String validateSSPId(val) {
    if (val.length < 4) {
      return 'SSP ID Must be at least 4 chars long';
    }

    return null;
  }
}
