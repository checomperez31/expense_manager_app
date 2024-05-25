import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  final List<RadioButtonOption> options;
  const RadioButton({super.key, required this.options});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...widget.options.map((e) => Expanded(
            child: Container(
              height: 30,
              color: Colors.amber,
              child: Text(e.description),
            )
        ))
      ],
    );
  }
}

class RadioButtonOption {
  Object id;
  String description;

  RadioButtonOption({required this.id, required this.description});
}
