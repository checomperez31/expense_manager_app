import 'package:expensemanager/models/account-type-model/account-type-model.dart';
import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/screens/account/account-form-provider.dart';
import 'package:expensemanager/utils/utils.dart';
import 'package:expensemanager/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountFormScreen extends StatelessWidget {
  const AccountFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modalEntity = ModalRoute.of(context)?.settings.arguments as Account?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva cuenta'),
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (_) => AccountFormProvider(modalEntity),
          child: Consumer<AccountFormProvider>(
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
                            initialValue: provider.name,
                            decoration: InputDecorationUtils.getDefault(label: 'Nombre'),
                            textInputAction: TextInputAction.next,
                            onChanged: (value) => provider.name = value,
                          ),
                          const SizedBox(height: 15),
                          SelectorInput<AccountType>(
                            initialValue: provider.type,
                            fetchData: AccountTypeWebService().getList,
                            decoration: InputDecorationUtils.getDefault(label: 'Tipo'),
                            onChange: (value) => provider.type = value,
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            initialValue: provider.amount,
                            decoration: InputDecorationUtils.getDefault(label: 'Cantidad'),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onChanged: (value) => provider.amount = value,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SaveButton(
                                text: 'Guardar',
                                onPressed: () => provider.save().then((value) {
                                  Navigator.of(context).pop();
                                }).catchError((err) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ha ocurrido un error')));
                                }),
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
