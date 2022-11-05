import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const SaveButton({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: onPressed,
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
    child: Text(text),
  );
}
