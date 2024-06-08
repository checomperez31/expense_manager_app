import 'package:expensemanager/models/catalog.dart';
import 'package:flutter/material.dart';

class SelectDialog<X extends Catalog> extends StatefulWidget {
  final Future<List<X>> Function() fetchData;
  final String title;
  final List<X>? omittedValues;
  final ListTile Function(X, GestureTapCallback?)? customTile;

  const SelectDialog({Key? key , required this.fetchData, required this.title, this.omittedValues, this.customTile}) : super(key: key);

  @override
  State<SelectDialog> createState() => _SelectDialogState<X>();
}

class _SelectDialogState<X extends Catalog> extends State<SelectDialog<X>> {
  
  List<X> elements = [];

  Future<List<X>> Function() get fetchData => widget.fetchData;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          fetchData().then((value) {
            setState(() => elements = value);
          });
        },
        child: ListView(
          children: elements
              .where((element) => widget.omittedValues != null ? (widget.omittedValues!.indexWhere((e) => e.identifier == element.identifier) < 0): true)
              .map((e) {
                return widget.customTile != null ? widget.customTile!(e, () => Navigator.of(context).pop( e )): ListTile(
                  title: Text(e.description ?? 'SIN DESCRIPCION'),
                  onTap: () => Navigator.of(context).pop( e ),
                );
          }).toList(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      setState(() => elements = value);
    });
  }
}
