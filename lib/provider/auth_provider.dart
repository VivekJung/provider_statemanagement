import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  //showing if the condition is loading or not
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    final uri = Uri.parse('https://reqres.in/api/login');
    try {
      http.Response response = await http.post(uri, body: {
        'email': email,
        'password': password,
      });

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log('Login successful');
        setLoading(false);
      } else {
        setLoading(false);
        log('Login FAILED');
      }
    } catch (e) {
      setLoading(false);
      log('Error while logging in$e');
    }
  }
}
