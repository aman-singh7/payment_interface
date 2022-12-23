import 'package:payment_interface/viewmodels/base_viewmodel.dart';

class SuccessViewModel extends BaseModel {
  bool _animationCompleted = false;

  bool get animationCompleted => _animationCompleted;

  set animationCompleted(bool val) {
    _animationCompleted = val;
    notifyListeners();
  }
}
