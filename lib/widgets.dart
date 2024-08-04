import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ValueLabel(
              value: "\$1000",
              label: "Money",
            ),
            ValueLabel(
              value: "69",
              label: "Sold",
            ),
            ValueLabel(
              value: "420",
              label: "In Stock",
            ),
          ],
        ),
        padding: EdgeInsets.all(20),
      ),
      // padding
      margin: EdgeInsets.all(20),
    );
  }
}

class ValueLabel extends StatelessWidget {
  final String value;
  final String label;

  const ValueLabel({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}
