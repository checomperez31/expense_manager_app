import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  final List<RadioButtonOption> options;
  RadioButtonOption? selected = null;
  Function(RadioButtonOption)? onSelect;

  RadioButton({super.key, required this.options, this.onSelect, RadioButtonOption? initialValue}) {
    if ( initialValue != null ) {
      selected = initialValue;
    }
  }

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...widget.options.map((e) {
          var index = widget.options.indexOf(e);
          const rounded = Radius.circular(8);
          const notRounded = Radius.circular(0);
          var first = index == 0;
          var last = index == widget.options.length - 1;
          var color = Theme.of(context).primaryColor;
          var isSelected = widget.selected != null && widget.selected!.id == e.id;
          return Expanded(
              child: GestureDetector(
            onTap: () => setState(() {
              widget.selected = e;
              if ( widget.onSelect != null ) widget.onSelect!(e);
            }),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 30,
              decoration: BoxDecoration(
                  color: isSelected ? color : null,
                  borderRadius: first || last ? BorderRadius.only(
                    topLeft: first ? rounded : notRounded,
                    bottomLeft: first ? rounded : notRounded,
                    topRight: last ? rounded : notRounded,
                    bottomRight: last ? rounded : notRounded,
                  ): null,
                  border: Border(
                    top: BorderSide(color: color, width: 1),
                    bottom: BorderSide(color: color, width: 1),
                    left: BorderSide(color: color, width: first || last ? 1: 0),
                    right: BorderSide(color: color, width: first || last ? 1: 0),
                  )),
              child: Center(child: Text(e.description ?? 'NA', style: TextStyle(color: isSelected ? Colors.white: null))),
            ),
          ));
        })
      ],
    );
  }
}

class RadioButtonOption {
  Object id;
  String? description;

  RadioButtonOption({required this.id, this.description});
}
