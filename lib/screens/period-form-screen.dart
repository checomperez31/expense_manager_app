import 'package:flutter/material.dart';

class PeriodFormScreen extends StatelessWidget {
  const PeriodFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo periodo'),
      ),
      body: Center(
        child: Text('Aqui va a ir la forma de un nuevo periodo'),
      ),
    );
  }
}
