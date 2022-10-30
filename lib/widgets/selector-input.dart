import 'package:expensemanager/models/catalog.dart';
import 'package:expensemanager/utils/utils.dart';
import 'package:expensemanager/widgets/select-dialog.dart';
import 'package:flutter/material.dart';

class SelectorInput<X extends Catalog> extends StatefulWidget {
  final InputDecoration decoration;
  final Future<List<X>> Function() fetchData;
  final void Function(X)? onChange;
  final X? initialData;

  const SelectorInput({
    Key? key,
    this.decoration = const InputDecoration(),
    required this.fetchData,
    this.onChange,
    this.initialData
  }) : super(key: key);

  @override
  State<SelectorInput<X>> createState() => _SelectorInputState<X>();
}

class _SelectorInputState<X extends Catalog> extends State<SelectorInput<X>> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if ( widget.initialData != null ) {
      controller.text = widget.initialData!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: AlwaysDisabledFocusNode(),
      controller: controller,
      decoration: widget.decoration,
      onTap: () => showSelectDialog(context),
    );
  }

  showSelectDialog(BuildContext context) async{
    Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => SelectDialog<X>(fetchData: widget.fetchData, title: widget.decoration.hintText ?? widget.decoration.labelText ?? 'Seleccione una opcion')
    )).then((value) {
      if ( value != null ) {
        controller.text = value.description;
        if ( widget.onChange != null ) widget.onChange!( value );
      }
    });
  }
}
