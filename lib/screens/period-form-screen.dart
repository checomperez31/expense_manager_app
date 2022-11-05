import 'package:expensemanager/models/account/account-service.dart';
import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/screens/period-form-provider.dart';
import 'package:expensemanager/utils/input-decoration.dart';
import 'package:expensemanager/widgets/selector-input.dart';
import 'package:expensemanager/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeriodFormScreen extends StatelessWidget {
  const PeriodFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo periodo'),
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (_) => PeriodFormProvider(),
          child: Consumer<PeriodFormProvider>(
            builder: (_, provider, __) => Form(
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: provider.description,
                              decoration: InputDecorationUtils.getDefault(label: 'Descripción'),
                              onChanged: (value) => provider.description = value,
                            ),
                            const SizedBox(height: 15),
                            DateInput(
                              initialValue: provider.initialDate,
                              decoration: InputDecorationUtils.getDefault(label: 'Fecha inicial'),
                              onChange: (value) => provider.initialDate = value,
                            ),
                            const SizedBox(height: 15),
                            DateInput(
                              initialValue: provider.finalDate,
                              decoration: InputDecorationUtils.getDefault(label: 'Fecha final'),
                              onChange: (value) => provider.finalDate = value,
                            ),
                            const SizedBox(height: 15),
                            SelectorInput<Account>(
                              fetchData: AccountService().getList,
                              decoration: InputDecorationUtils.getDefault(label: 'Cuenta'),
                              initialValue: provider.account,
                              onChange: (value) => provider.account = value,
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
                )
            ),
          ),
        )
      ),
    );
  }
}
