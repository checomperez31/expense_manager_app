import 'package:flutter/material.dart';

class DescriptionTile extends StatelessWidget {
  final String title;
  final String? descriptionText;
  final Widget? description;
  const DescriptionTile({Key? key, required this.title, this.description, this.descriptionText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          if ( descriptionText != null ) Text(descriptionText!),
          if ( description != null ) description!
        ],
      ),
    );
  }
}
