import 'dart:convert';
import 'package:crypto/crypto.dart';

String? validateMobile(String? value) {
  if (value != null) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
  }
  return null;
}

String? validateEmail(String? value) {
  if (value != null) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      print('validation done');
      print('Value ====> $value');
      return 'Enter Valid Email';
    }
  }
  return null;
}

String? validatePin(String? value) {
  if (value != null) {
    String pattern = r'(^(?:[+0]9)?[0-9]{6}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter the pin.';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid pin.';
    }
  }
  return null;
}

String? validateGST(String? value) {
  if (value != null) {
    if (value.length > 0) {
      if (value.length <= 4) {
        return 'Please enter a valid GST ID.';
      }
    }
  } else if (value == '' || value == null) {
    return null;
  } else {
    return null;
  }
}

String? validateName(String? value) {
  if (value?.length == 0)
    return 'Please enter a valid name';
  else {
    value?.trim();
    return null;
  }
}

String? hashing(String? password) {
  if (password != null) {
    if (password.length < 6)
      return 'Password must be more than 6 characters';
    else if (password.length > 6) {
      List<int> bytes = utf8.encode(password);

      Digest digest = sha256.convert(bytes);

      print("Digest as bytes: ${digest.bytes}");
      print("Digest as hex string: $digest");
    }
  }
  return null;
}
