import 'package:flutter/foundation.dart';

class SetupData {
  final String? key;
  final String? email;
  final int amount;
  final String? ref;

  final VoidCallback? onClose;
  final PaystackCallback? callback;

  SetupData({
    required this.key,
    required this.email,
    required this.amount,
    required this.ref,
    this.onClose,
    this.callback,
  });
}

class Handler {
  external void openIframe();
}

class ChargeResponse {
  external String get message;

  external String get reference;

  external String get response;

  external String get status;
}

typedef PaystackCallback(ChargeResponse response);
