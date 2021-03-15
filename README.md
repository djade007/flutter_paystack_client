# flutter_paystack_client

<p>
    <img src="https://raw.githubusercontent.com/djade007/flutter_paystack_client/master/screenshots/web.png" width="400px" height="auto" hspace="20"/>
    <img src="https://raw.githubusercontent.com/djade007/flutter_paystack_client/master/screenshots/iphone.png" width="200px" height="auto" hspace="20"/>
</p>

A Flutter plugin for making payments via Paystack Payment Gateway. Supports web, and mobile devices as a wrapper
around https://pub.dev/packages/flutter_paystack

## :rocket: Installation

To use this plugin, add `flutter_paystack_client` as
a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

Then initialize the plugin preferably in the `initState` of your widget.

``` dart
import 'package:flutter_paystack_client/flutter_paystack_client.dart';

class _PaymentPageState extends State<PaymentPage> {
  var publicKey = '[YOUR_PAYSTACK_PUBLIC_KEY]';

  @override
  void initState() {
    PaystackClient.initialize(
            publicKey: publicKey);
  }
}
```

### Usage

 ```dart

Charge charge = Charge()
  ..amount = 10000
  ..reference = _getReference()
  ..email = 'customer@email.com';

CheckoutResponse response = await
PaystackPlugin.checkout(

context context,
    charge
:
charge,);
 ```

It is recommended that when `PaystackClient.checkout()` returns, the payment should be
[verified](https://developers.paystack.co/v2.0/reference#verify-transaction)
on your backend.