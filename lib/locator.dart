import 'package:get_it/get_it.dart';
import 'package:payment_interface/viewmodels/home_viewmodel.dart';
import 'package:payment_interface/viewmodels/pay_viewmodel.dart';
import 'package:payment_interface/viewmodels/success_viewmodel.dart';
import 'package:payment_interface/viewmodels/upi_viewmodel.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => PayViewModel());
  locator.registerFactory(() => UpiViewModel());
  locator.registerFactory(() => SuccessViewModel());
}
