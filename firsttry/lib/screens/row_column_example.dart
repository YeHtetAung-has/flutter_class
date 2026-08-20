import 'package:flutter/material.dart';

class RowColumnExample extends StatelessWidget {
  const RowColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text("Row and Column Examples"),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            // side: BorderSide(
            //   color: Colors.orange,
            //   width: 2
            // ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)
              )
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Row (horizontal)', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _box(Colors.red, 'A'),
                _box(Colors.green, 'B'),
                _box(Colors.blue, 'C'),
              ],
            ),
            const Text('Column (vertical)', style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _box(Colors.orange, '1'),
                const SizedBox(height: 8),
                _box(Colors.purple, '2'),
                const SizedBox(height: 8),
                _box(Colors.teal, '3'),
              ],
            ),
            const Text('Row with Expanded', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(flex: 1, child: _box(Colors.red, '1x')),
                Expanded(flex: 2, child: _box(Colors.green, '2x')),
                Expanded(flex: 1, child: _box(Colors.blue, '1x')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
Widget _box(Color color, String label) {
  return Container(
    width: 60,
    height: 60,
    color: color,
    alignment: Alignment.center,
    child: Text(label, style: const TextStyle(color: Colors.white)),
  );
}