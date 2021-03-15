@JS()
library paystack_js;

import "package:js/js.dart";

import 'models.dart';

@JS('PaystackPop')
class PaystackPop {
  @JS('setup')
  external static Handler setup(SetupData data);
}

Handler setup(SetupData data) {
  return PaystackPop.setup(data);
}
