import 'package:expensemanager/models/catalog.dart';
import 'package:flutter/material.dart';

class SelectDialog<X extends Catalog> extends StatefulWidget {
  final Future<List<X>> Function() fetchData;
  final String title;

  const SelectDialog({Key? key , required this.fetchData, required this.title}) : super(key: key);

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
          children: elements.map((e) => ListTile(
            onTap: () => Navigator.of(context).pop( e ),
            title: Text(e.description ?? 'SIN DESCRIPCION'),
          )).toList(),
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
