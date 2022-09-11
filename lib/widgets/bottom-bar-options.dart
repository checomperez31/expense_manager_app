import 'package:expensemanager/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BottomBarOptions extends StatefulWidget {
  final int actualIndex;
  final Function(int index) onSelect;
  const BottomBarOptions({Key? key, required this.onSelect, this.actualIndex = 0}) : super(key: key);

  @override
  State<BottomBarOptions> createState() => _BottomBarOptionsState();
}

class _BottomBarOptionsState extends State<BottomBarOptions> {
  int localIndex = 0;


  @override
  void initState() {
    super.initState();
    localIndex = widget.actualIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 80),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          BottomBarButton(
            onPressed: _selectOption,
            index: 0,
            icon: Icons.wallet,
            title: 'Gastos',
            selected: localIndex,
          ),
          BottomBarButton(
            onPressed: _selectOption,
            index: 1,
            icon: Icons.credit_card,
            title: 'Cuentas',
            selected: localIndex,
          ),
          BottomBarButton(
            onPressed: _selectOption,
            index: 2,
            icon: Icons.calendar_month_outlined,
            title: 'Periodos',
            selected: localIndex,
          ),
        ],
      ),
    );
  }

  _selectOption(int index) {
    setState(() {
      localIndex = index;
      widget.onSelect(index);
    });
  }
}
