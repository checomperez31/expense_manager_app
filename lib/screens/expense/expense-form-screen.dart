import 'package:expensemanager/models/account/account-service.dart';
import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/models/expense-type/expense-type-service.dart';
import 'package:expensemanager/models/expense-type/expense-type.dart';
import 'package:expensemanager/models/expense/expense.dart';
import 'package:expensemanager/models/period/period-service.dart';
import 'package:expensemanager/models/period/period.dart';
import 'package:expensemanager/screens/expense/expense-form-provider.dart';
import 'package:expensemanager/utils/color-utils.dart';
import 'package:expensemanager/utils/font-awesome-icons-mapper.dart';
import 'package:expensemanager/utils/input-decoration.dart';
import 'package:expensemanager/widgets/radio-button.dart';
import 'package:expensemanager/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ExpenseFormScreen extends StatelessWidget {
  const ExpenseFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modalEntity = ModalRoute.of(context)?.settings.arguments as Expense?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo gasto'),
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (_) => ExpenseFormProvider(modalEntity),
          child: Consumer<ExpenseFormProvider>(
            builder: (_, provider, __) => Form(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Tipo de movimiento'),
                          const SizedBox(height: 1),
                          RadioButton(
                            onSelect: (option) => provider.movementType = option.id.toString(),
                            options: [
                              RadioButtonOption(id: 'G', description: 'Gasto'),
                              RadioButtonOption(id: 'I', description: 'Ingreso'),
                              RadioButtonOption(id: 'T', description: 'Transferencia'),
                            ],
                            initialValue: RadioButtonOption(id: provider.movementType),
                          ),
                          const SizedBox(height: 15),
                          SelectorInput<Account>(
                            fetchData: AccountService().getList,
                            decoration: InputDecorationUtils.getDefault(label: 'Cuenta'),
                            initialValue: provider.account,
                            onChange: (value) => provider.account = value,
                          ),
                          if (provider.movementType == 'T') const SizedBox(height: 15),
                          if ( provider.movementType == 'T' ) SelectorInput<Account>(
                            fetchData: AccountService().getList,
                            decoration: InputDecorationUtils.getDefault(label: 'Cuenta a transferir'),
                            initialValue: provider.accountToTransfer,
                            onChange: (value) => provider.accountToTransfer = value,
                            omittedValues: provider.account != null ? [ provider.account! ]: null,
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            initialValue: provider.description,
                            decoration: InputDecorationUtils.getDefault(label: 'Descripcion'),
                            onChanged: (value) => provider.description = value,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                          const SizedBox(height: 15),
                          SelectorInput<ExpenseType>(
                            fetchData: ExpenseTypeService().getList,
                            decoration: InputDecorationUtils.getDefault(label: 'Tipo'),
                            initialValue: provider.type,
                            onChange: (value) => provider.type = value,
                            customTile: (val, tap) => ListTile(
                              leading: _icon( val ),
                              minLeadingWidth: 30,
                              title: Text(val.description ?? 'SIN DESCRIPCION'),
                              onTap: tap,
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            initialValue: provider.amount,
                            decoration: InputDecorationUtils.getDefault(label: 'Cantidad'),
                            onChanged: (value) => provider.amount = value,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 15),
                          const Text('Impactar en cuenta'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  const Text('Si'),
                                  Radio<bool>(value: true, groupValue: provider.impact, onChanged: (value) {
                                    provider.impact = value ?? true;
                                  }),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('No'),
                                  Radio<bool>(value: false, groupValue: provider.impact, onChanged: (value) {
                                    provider.impact = value ?? false;
                                  }),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Text('Tipo de movimiento'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  const Text('Gasto'),
                                  Radio<String>(value: 'G', groupValue: provider.movementType, onChanged: (value) {
                                    provider.movementType = value ?? 'G';
                                  }),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Ingreso'),
                                  Radio<String>(value: 'I', groupValue: provider.movementType, onChanged: (value) {
                                    provider.movementType = value ?? 'I';
                                  }),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Transferencia'),
                                  Radio<String>(value: 'T', groupValue: provider.movementType, onChanged: (value) {
                                    provider.movementType = value ?? 'T';
                                  }),
                                ],
                              )
                            ],
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
                                onPressed: provider.saving ? null: () => provider.save().then((value) {
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

  Widget? _icon(ExpenseType entity) {
    if ( entity.icon == null ) return null;
    return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
            color: ColorUtils.fromHex(entity.color!, '30'),
            borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Center(
          child: FaIcon(FontAwesomeIconsMapper.getIcon( entity.icon! ), color: ColorUtils.fromHex(entity.color!, 'ff'), size: 15),
        )
    );
  }
}
