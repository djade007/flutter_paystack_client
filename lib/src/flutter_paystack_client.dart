import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_paystack_client/src/paystack_web.dart';

export 'package:flutter_paystack/src/models/charge.dart';

class PaystackClient {
  static String? _publicKey;
  static var _web = PaystackWeb();
  static var _plugin = PaystackPlugin();

  static Future<void> initialize(String publicKey) async {
    _publicKey = publicKey;

    if (!kIsWeb) {
      _plugin.initialize(publicKey: _publicKey!);
    }
  }

  static Future<CheckoutResponse> checkout(
    BuildContext context, {
    required Charge charge,
    bool fullscreen = false,
    Widget? logo,
    bool hideEmail = false,
    bool hideAmount = false,
  }) async {
    if (_publicKey == null || _publicKey!.isEmpty) {
      throw PlatformException(
        code: 'not-initialized',
        message: 'You are yet to initialize FlutterPaystackClient',
      );
    }

    if (kIsWeb) return _web.checkout(charge, _publicKey!);

    return _plugin.checkout(
      context,
      charge: charge,
      fullscreen: fullscreen,
      logo: logo,
      hideEmail: hideEmail,
      hideAmount: hideAmount,
      method: CheckoutMethod.card,
    );
  }
}
