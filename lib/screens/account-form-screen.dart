import 'package:expensemanager/models/account-type-model/account-type-model.dart';
import 'package:expensemanager/utils/utils.dart';
import 'package:expensemanager/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AccountFormScreen extends StatelessWidget {
  const AccountFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva cuenta'),
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
                      decoration: InputDecorationUtils.getDefault(label: 'Nombre'),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15),
                    Selector<AccountType>(
                      fetchData: AccountTypeWebService().getList,
                      decoration: InputDecorationUtils.getDefault(label: 'Tipo'),
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
