import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo App"),
      ),
      body: IndexedStack(
        children: [
          Center(
            child: Column(
              children: [
                Text("Home"),
                SizedBox(
                  height: 10,
                ),
                Builder(builder: (context) {
                  return ElevatedButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Text("Open drawer"));
                })
              ],
            ),
          ),
          DemoTab2(),
          Center(
            child: Text("Accounts"),
          ),
          DemoTab()
        ],
        index: currentIndex,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            // DrawerHeader(child: child)
            UserAccountsDrawerHeader(
              accountName: Text("Sample Account"),
              accountEmail: Text("sampleacc@gmail.com"),
              currentAccountPicture: CircleAvatar(),
            ),

            ListTile(
              title: Text("Home"),
            ),
            ListTile(
              title: Text("Dashboard"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Help"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.amber,
          selectedItemColor: Colors.pink,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              if (mounted) {
                // Update the state only if the widget is still mounted
                currentIndex = index;
              }
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Accounts"),
            BottomNavigationBarItem(icon: Icon(Icons.help), label: "Tabs"),
          ],
        ),
      ),
    );
  }
}

class DemoTab extends StatefulWidget {
  const DemoTab({Key? key}) : super(key: key);

  @override
  State<DemoTab> createState() => _DemoTabState();
}

class _DemoTabState extends State<DemoTab> {
  @override
  Widget build(BuildContext context) {
    //1.default tab controller
    //2. tabbar and tabs
    //3. tabbar view
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text("tabbar"),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.orange,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue.shade200),
            labelColor: Colors.pink,
            tabs: [
              Tab(
                icon: Icon(Icons.directions_car),
                text: "Car",
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
                text: "Train",
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
                text: "Cycle",
              ),
              Tab(
                icon: Icon(Icons.directions_car),
                text: "Car",
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
                text: "Train",
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
                text: "Cycle",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text("Car"),
            ),
            Center(
              child: Text("Train"),
            ),
            Center(
              child: Text("Cycle"),
            ),
            Center(
              child: Text("Car"),
            ),
            Center(
              child: Text("Train"),
            ),
            Center(
              child: Text("Cycle"),
            ),
          ],
        ),
      ),
    );
  }
}

class DemoTab2 extends StatefulWidget {
  const DemoTab2({Key? key}) : super(key: key);

  @override
  State<DemoTab2> createState() => _DemoTab2State();
}

class _DemoTab2State extends State<DemoTab2>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      print(tabController.index);
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tab demo"),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.directions_car),
              text: "Car",
            ),
            Tab(
              icon: Icon(Icons.directions_transit),
              text: "Train",
            ),
            Tab(
              icon: Icon(Icons.directions_bike),
              text: "Cycle",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(
            child: Text("Car"),
          ),
          Center(
            child: Text("Train"),
          ),
          Center(
            child: Text("Cycle"),
          )
        ],
      ),
    );
  }
}
