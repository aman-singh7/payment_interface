import 'package:flutter/material.dart';
import 'package:payment_interface/viewmodels/base_viewmodel.dart';

class UpiViewModel extends BaseModel {
  final TextEditingController controller = TextEditingController();

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool val) {
    _obscureText = val;
    notifyListeners();
  }
}
