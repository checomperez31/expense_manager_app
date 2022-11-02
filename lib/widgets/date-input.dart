import 'package:expensemanager/utils/always-disabled-focus-node.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends StatefulWidget {
  final InputDecoration decoration;
  const DateInput({
    Key? key,
    this.decoration = const InputDecoration()
  }) : super(key: key);

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: widget.decoration,
      focusNode: AlwaysDisabledFocusNode(),
      onTap: () => showDateDialog( context ),
    );
  }

  showDateDialog(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now()
    ).then((value) {
      if ( value != null ) {
        controller.text = DateFormat('dd/MM/yyyy').format(value);
      }
    });
  }
}

