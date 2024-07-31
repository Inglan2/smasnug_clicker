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
        Image(image: AssetImage('assets/smasnug.png')),
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
      child: OutlinedButton(
          onPressed: () {},
          child: Container(
            child: Text(
              "Make SMASNUG",
              style: new TextStyle(
                fontSize: 20.0,
              ),
            ),
            padding: EdgeInsets.all(50),
          )),
    );
  }
}
