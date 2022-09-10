import 'package:flutter/material.dart';

class ExpenseFormScreen extends StatelessWidget {
  const ExpenseFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo gasto'),
      ),
      body: Center(
        child: Text('Aqui va a ir la forma de un nuevo gasto'),
      ),
    );
  }
}
