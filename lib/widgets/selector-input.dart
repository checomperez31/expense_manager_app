import 'package:expensemanager/models/catalog.dart';
import 'package:expensemanager/utils/utils.dart';
import 'package:expensemanager/widgets/select-dialog.dart';
import 'package:flutter/material.dart';

class SelectorInput<X extends Catalog> extends StatefulWidget {
  final InputDecoration decoration;
  final Future<List<X>> Function() fetchData;
  final void Function(X)? onChange;
  final ListTile Function(X, GestureTapCallback?)? customTile;
  final X? initialValue;
  final List<X>? omittedValues;

  const SelectorInput({
    Key? key,
    this.decoration = const InputDecoration(),
    required this.fetchData,
    this.onChange,
    this.initialValue,
    this.omittedValues,
    this.customTile
  }) : super(key: key);

  @override
  State<SelectorInput<X>> createState() => _SelectorInputState<X>();
}

class _SelectorInputState<X extends Catalog> extends State<SelectorInput<X>> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if ( widget.initialValue != null ) {
      controller.text = widget.initialValue!.description;
    } else {
      controller.text = '';
    }
  }


  @override
  void didUpdateWidget(SelectorInput<X> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ( widget.initialValue == null ) {
      controller.text = '';
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
        builder: (_) => SelectDialog<X>(
          fetchData: widget.fetchData,
          title: widget.decoration.hintText ?? widget.decoration.labelText ?? 'Seleccione una opcion',
          omittedValues: widget.omittedValues,
          customTile: widget.customTile,
        )
    )).then((value) {
      if ( value != null ) {
        controller.text = value.description;
        if ( widget.onChange != null ) widget.onChange!( value );
      }
    });
  }
}
