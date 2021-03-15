import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';

import '.env.dart';

const String appName = 'Paystack Example';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PaystackClient.initialize(paystackPublicKey);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _email = '';
  int _amount = 0;
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Paystack Client Test'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (val) {
                _email = val;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) {
                try {
                  _amount = (double.parse(val) * 100).toInt();
                } catch (e) {}
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _message = '';
                });

                final charge = Charge()
                  ..email = _email
                  ..amount = _amount
                  ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}';
                final res =
                    await PaystackClient.checkout(context, charge: charge);

                if (res.status) {
                  _message = 'Charge was successful. Ref: ${res.reference}';
                } else {
                  _message = 'Failed: ${res.message}';
                }
                setState(() {});
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
