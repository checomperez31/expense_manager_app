import 'package:expensemanager/models/catalog.dart';
import 'package:expensemanager/utils/utils.dart';
import 'package:expensemanager/widgets/select-dialog.dart';
import 'package:flutter/material.dart';

class Selector<X extends Catalog> extends StatelessWidget {
  final InputDecoration decoration;
  final Future<List<X>> Function() fetchData;
  final TextEditingController controller = TextEditingController();
  Selector({Key? key, this.decoration = const InputDecoration(), required this.fetchData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: AlwaysDisabledFocusNode(),
      controller: controller,
      decoration: decoration,
      onTap: () => showSelectDialog(context),
    );
  }

  showSelectDialog(BuildContext context) async{
    Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => SelectDialog<X>(fetchData: fetchData)
    )).then((value) {
      if ( value != null ) {
        controller.text = value.description;
      }
    });
  }
}
