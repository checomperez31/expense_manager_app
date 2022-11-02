import 'package:expensemanager/models/account/account-service.dart';
import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/utils/input-decoration.dart';
import 'package:expensemanager/widgets/selector-input.dart';
import 'package:expensemanager/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PeriodFormScreen extends StatelessWidget {
  const PeriodFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo periodo'),
      ),
      body: SingleChildScrollView(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Descripcion',
                            border: OutlineInputBorder(),
                            hintText: 'Descripcion'
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Fecha inicial',
                            border: OutlineInputBorder(),
                            hintText: 'Fecha inicial'
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Fecha final',
                            border: OutlineInputBorder(),
                            hintText: 'Fecha final'
                        ),
                      ),
                      const SizedBox(height: 15),
                      DateInput(
                        decoration: InputDecorationUtils.getDefault(label: 'Fecha final'),
                      ),
                      const SizedBox(height: 15),
                      SelectorInput<Account>(
                        fetchData: AccountService().getList,
                        decoration: InputDecorationUtils.getDefault(label: 'Cuenta'),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    )
                                ),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(horizontal: 30)
                                )
                            ),
                            child: const Text('Guardar'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
