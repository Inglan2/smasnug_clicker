import 'package:flutter/material.dart';
import 'widgets.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMASNUG Factory Simulator',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, brightness: Brightness.dark),
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    var isSmallScreen = screenSize.width < 1000;
    var containerWidth =
        isSmallScreen ? screenSize.width : screenSize.width / 2;

    final leftContainerKey = GlobalKey();
    final rightContainerKey = GlobalKey();

    return Scaffold(
        appBar: AppBar(
          title: Text("SMASNUG Factory Simulator"),
        ),
        body: ListView(
          scrollDirection: Axis.horizontal,
          physics: PageScrollPhysics(), // Enable snapping effect
          children: [
            Container(
              width: containerWidth,
              child: Column(
                children: [
                  Expanded(child: Left()),
                  if (isSmallScreen)
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                          onPressed: () {
                            Scrollable.ensureVisible(
                              rightContainerKey.currentContext!,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeOutExpo,
                            );
                          },
                          child: Text("More")),
                    ),
                ],
              ),
              key: leftContainerKey,
            ),
            Container(
              width: containerWidth,
              child: Column(
                children: [
                  Expanded(child: Right()),
                  if (isSmallScreen)
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                          onPressed: () {
                            Scrollable.ensureVisible(
                                leftContainerKey.currentContext!,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeOutExpo);
                          },
                          child: Text("Manufacture")),
                    ),
                ],
              ),
              key: rightContainerKey,
            ),
          ],
        ));
  }
}

class Right extends StatefulWidget {
  const Right({
    super.key,
  });

  @override
  State<Right> createState() => _RightState();
}

class _RightState extends State<Right> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
            title: <Widget>[
          Text("Upgrades"),
          Text("Automation"),
          Text("Advertising"),
          Text("Settings"),
        ][selectedIndex]),
        body: <Widget>[
          Card(
            shadowColor: Colors.transparent,
            margin: const EdgeInsets.all(8.0),
            child: SizedBox.expand(
              child: Center(
                child: Text(
                  'Upgrades page',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.transparent,
            margin: const EdgeInsets.all(8.0),
            child: SizedBox.expand(
              child: Center(
                child: Text(
                  'Automation page',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.transparent,
            margin: const EdgeInsets.all(8.0),
            child: SizedBox.expand(
              child: Center(
                child: Text(
                  'Advertising page',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.transparent,
            margin: const EdgeInsets.all(8.0),
            child: SizedBox.expand(
              child: Center(
                child: Text(
                  'Settings page',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
          ),
        ][selectedIndex],
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
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
        ));
  }
}

class Left extends StatefulWidget {
  const Left({super.key});

  @override
  State<Left> createState() => _LeftState();
}

class _LeftState extends State<Left> {
  int money = 1000;
  int sold = 0;
  int inStock = 0;

  void buildSmasnug() {
    setState(() {
      inStock += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stats(
            money: money,
            sold: sold,
            inStock: inStock,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: buildSmasnug,
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
                  padding: EdgeInsets.all(10),
                )),
          ),
        ],
      ),
    );
  }
}
