import 'package:flutter/material.dart';

class AccountFormScreen extends StatelessWidget {
  const AccountFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva cuenta'),
      ),
      body: Center(
        child: Text('Aqui va a ir la forma de una nueva cuenta'),
      ),
    );
  }
}
