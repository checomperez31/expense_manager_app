import 'package:expensemanager/models/account-type-model/account-type-model.dart';
import 'package:expensemanager/screens/account-form-provider.dart';
import 'package:expensemanager/utils/utils.dart';
import 'package:expensemanager/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountFormScreen extends StatelessWidget {
  const AccountFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva cuenta'),
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (_) => AccountFormProvider(),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => provider.save(),
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
              ),
            ),
          ),
        )
      ),
    );
  }
}
