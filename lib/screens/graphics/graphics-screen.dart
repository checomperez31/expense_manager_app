import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class GraphicsScreen extends StatelessWidget {
  const GraphicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (_, index) => ListTile(
        title: Text('Sin descripcion'),
        subtitle: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 300,
                      child: Chart(
                        data: [
                          { 'genre': 'Sports', 'sold': 275 },
                          { 'genre': 'Strategy', 'sold': 115 },
                          { 'genre': 'Action', 'sold': 120 },
                          { 'genre': 'Shooter', 'sold': 350 },
                          { 'genre': 'Other', 'sold': 150 },
                        ],
                        variables: {
                          'genre': Variable(
                            accessor: (Map map) => map['genre'] as String,
                          ),
                          'sold': Variable(
                            accessor: (Map map) => map['sold'] as num,
                          ),
                        },
                        marks: [IntervalMark()],
                        axes: [
                          Defaults.horizontalAxis,
                          Defaults.verticalAxis,
                        ],
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
      itemCount: 1,
      separatorBuilder: (_, index) => const Divider(height: 1),
    );
  }
}
