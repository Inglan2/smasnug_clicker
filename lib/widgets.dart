import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  final int money;
  final int sold;
  final int inStock;

  const Stats({
    super.key,
    required this.money,
    required this.sold,
    required this.inStock,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ValueLabel(
              value: "\$" + money.toString(),
              label: "Money",
            ),
            ValueLabel(
              value: sold.toString(),
              label: "Sold",
            ),
            ValueLabel(
              value: inStock.toString(),
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
