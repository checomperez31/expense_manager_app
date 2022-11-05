import 'package:expensemanager/models/account/account-service.dart';
import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/models/expense-type/expense-type-service.dart';
import 'package:expensemanager/models/expense-type/expense-type.dart';
import 'package:expensemanager/models/period/period-service.dart';
import 'package:expensemanager/models/period/period.dart';
import 'package:expensemanager/screens/expense-form-provider.dart';
import 'package:expensemanager/utils/input-decoration.dart';
import 'package:expensemanager/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseFormScreen extends StatelessWidget {
  const ExpenseFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo gasto'),
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (_) => ExpenseFormProvider(),
          child: Consumer<ExpenseFormProvider>(
            builder: (_, provider, __) => Form(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: Column(
                        children: [
                          SelectorInput<Account>(
                            fetchData: AccountService().getList,
                            decoration: InputDecorationUtils.getDefault(label: 'Cuenta'),
                            initialValue: provider.account,
                            onChange: (value) => provider.account = value,
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            initialValue: provider.description,
                            decoration: InputDecorationUtils.getDefault(label: 'Descripcion'),
                            onChanged: (value) => provider.description = value,
                          ),
                          const SizedBox(height: 15),
                          SelectorInput<ExpenseType>(
                            fetchData: ExpenseTypeService().getList,
                            decoration: InputDecorationUtils.getDefault(label: 'Tipo'),
                            initialValue: provider.type,
                            onChange: (value) => provider.type = value,
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            initialValue: provider.amount,
                            decoration: InputDecorationUtils.getDefault(label: 'Cantidad'),
                            onChanged: (value) => provider.amount = value,
                          ),
                          const SizedBox(height: 15),
                          SelectorInput<Period>(
                            fetchData: PeriodService().getList,
                            decoration: InputDecorationUtils.getDefault(label: 'Periodo'),
                            initialValue: provider.period,
                            onChange: (value) => provider.period = value,
                          ),
                          const SizedBox(height: 15),
                          DateInput(
                            initialValue: provider.expenseDate,
                            decoration: InputDecorationUtils.getDefault(label: 'Fecha'),
                            onChange: (value) => provider.expenseDate = value,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SaveButton(
                                text: 'Guardar',
                                onPressed: provider.save,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
