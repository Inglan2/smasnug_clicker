import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets.dart';

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
        title: 'SMASNUG Factory Simulator',
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
        title: Text("SMASNUG Factory Simulator"),
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
    final theme = Theme.of(context);
    return Column(
      children: [
        Expanded(child: Column()),
        NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.keyboard_arrow_up),
              label: "Upgrades",
            ),
            NavigationDestination(
              icon: Icon(Icons.build),
              label: "Automation",
            ),
            NavigationDestination(
              icon: Icon(Icons.campaign),
              label: "Advertising",
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
          backgroundColor: theme.colorScheme.surface,
        )
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
          Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.build, size: 30),
                      SizedBox(width: 20),
                      Text("Manufacture SMASNUG",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                    ],
                  ),
                  padding: EdgeInsets.all(50),
                )),
          ),
        ],
      ),
    );
  }
}
