import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class Controller extends GetxController {
  var selected = 0.obs;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final PageController pager = PageController();
    var state = Get.put(Controller());

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("TOP Menu"),
          ),
          body: PageView(
            controller: pager,
            children: const <Widget>[
              Home(),
              Page1(),
              Page2(),
            ],
            onPageChanged: (int i) {
              state.selected.value = i;
            },
          ),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.access_time), label: 'Page1'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.accessibility_new), label: 'Page2'),
                ],
                currentIndex: state.selected.value,
                onTap: (int i) {
                  state.selected.value = i;
                  pager.jumpToPage(i);
                },
              )),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                'https://cdn.pixabay.com/photo/2017/03/01/15/40/internationalwomensday-2108838_960_720.png'),
            const Text(
              'You have pushed the button this many times:',
            ),

            Image.network(
                'https://cdn.pixabay.com/photo/2017/03/01/15/41/internationalwomensday-2108840_960_720.png'),
            const Text(
              'You have pushed the button this many times:',
            ),
            // Text(showTimePicker(context: context, initialTime: initialTime)
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// ---------- Home ----------
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => "Item $i");
    return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueAccent, Colors.white]),
        ),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.phone),
              title: Text(items[index]),
            );
          },
        ));
    //   child: const Text('Home',
    //       style: TextStyle(color: Colors.white, fontSize: 32.0)),
    // );
  }
}

// ---------- Page1 ----------
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.green, Colors.white]),
      ),
      child: Column(
        children: [
                    const SizedBox(height: 20.0,),
          TextField(
            decoration: const InputDecoration(
              hintText: 'name',
            ),
            onChanged: (text) {},
          ),
                    const SizedBox(height: 20.0,),
          TextField(
            controller: myController,
            decoration: const InputDecoration(
              hintText: 'hobby',
            ),
          ),
          const SizedBox(height: 20.0,),
          ElevatedButton(
            // style: ElevatedButton.styleFrom(
            //   foregroundColor: Colors.blueAccent,
            // ),
            child:  const Text('new'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class RaisedButton {}

// ---------- Page2 ----------
class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.purpleAccent, Colors.white]),
      ),
      child: const Text('Page2',
          style: TextStyle(color: Colors.white, fontSize: 32.0)),
    );
  }
}
