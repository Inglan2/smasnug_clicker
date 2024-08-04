import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainAppState(),
      child: MaterialApp(
        title: 'SMASNUG Clicker',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue, brightness: Brightness.dark),
          brightness: Brightness.dark,
        ),
        home: HomePage(),
      ),
    );
  }
}

class MainAppState extends ChangeNotifier {}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();
    final theme = Theme.of(context); // ← Add this.

    return Scaffold(
      appBar: AppBar(
        title: Text("SMASNUG Clicker"),
      ),
      body: Row(
        children: [
          Expanded(
            child: Left(),
          ),
          Expanded(
            child: Right(),
          ),
        ],
      ),
    );
  }
}

class Right extends StatelessWidget {
  const Right({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("stuff"),
      ],
    );
  }
}

class Left extends StatelessWidget {
  const Left({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stats(),
          OutlinedButton(
              onPressed: () {},
              child: Container(
                child: Text("Manufacture SMASNUG"),
                padding: EdgeInsets.all(50),
              )),
        ],
      ),
    );
  }
}

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
