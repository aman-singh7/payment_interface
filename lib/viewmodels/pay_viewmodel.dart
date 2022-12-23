import 'package:flutter/material.dart';
import 'package:payment_interface/viewmodels/base_viewmodel.dart';

class PayViewModel extends BaseModel {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();
}
