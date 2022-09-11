import 'package:flutter/material.dart';

class BottomBarButton extends StatelessWidget {
  final int index;
  final Function(int index) onPressed;
  final IconData? icon;
  final String? title;
  final int? selected;
  const BottomBarButton({Key? key, required this.index, required this.onPressed, this.icon, this.title, this.selected})
      : assert(icon != null || title != null, 'title and icon are null should be defined at least one of them'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: selected != index ? ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.grey)
        ): null,
        onPressed: () => onPressed(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if ( icon != null ) Icon(icon),
            if ( title != null ) Text(title!)
          ],
        )
      ),
    );
  }
}
