import 'package:expensemanager/utils/always-disabled-focus-node.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends StatefulWidget {
  final InputDecoration decoration;
  final DateTime? initialValue;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final void Function(DateTime)? onChange;
  const DateInput({
    Key? key,
    this.decoration = const InputDecoration(),
    this.initialValue,
    this.firstDate,
    this.lastDate,
    this.onChange
  }) : super(key: key);

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  TextEditingController controller = TextEditingController();
  String dateFormat = 'dd/MM/yyyy';


  @override
  void initState() {
    super.initState();
    if ( widget.initialValue != null ) {
      setValue(widget.initialValue!, emit: false);
    }
  }

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
    final now = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: widget.firstDate ?? now.subtract(const Duration(days: 18250)),
      lastDate: widget.lastDate ?? now.add(const Duration(days: 365))
    ).then((value) {
      if ( value != null ) {
        setValue( value );
      }
    });
  }

  setValue(DateTime value, {emit = true}) {
    controller.text = DateFormat( dateFormat ).format(value);
    if ( emit && widget.onChange != null ) {
      widget.onChange!( value );
    }
  }
}

