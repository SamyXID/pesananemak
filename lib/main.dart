import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF339CC9),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  List<DataTodo> listTodo = [
    DataTodo(
        title: "Cabe 1 Kilo",
        subtitle: "Rabu, 12 Maret 2k19",
        circleIcon: circle(Colors.deepPurple)),
    DataTodo(
        title: "Daging 1 Kilo",
        subtitle: "Rabu, 12 Maret 2k19",
        circleIcon: circle(Colors.green)),
    DataTodo(
        title: "Tomat 1 Kilo",
        subtitle: "Rabu, 12 Maret 2k19",
        circleIcon: circle(Colors.lime)),
    DataTodo(
        title: "Kecap Bangau Botol 1 Liter",
        subtitle: "Rabu, 12 Maret 2k19",
        circleIcon: circle(Colors.teal)),
    DataTodo(
        title: "BlueBand 1 Liter",
        subtitle: "Rabu, 12 Maret 2k19",
        circleIcon: circle(Colors.redAccent)),
  ];

  static Widget circle(warna) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: warna),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesanan Emak"),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(
              text: "To do",
              icon: Icon(Icons.add),
            ),
            Tab(
              text: "History",
              icon: Icon(Icons.history),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Container(
            child: ListView.builder(
              itemCount: listTodo.length,
              itemBuilder: (context, posisi) {
                return ListTile(
                  leading: listTodo.elementAt(posisi).circleIcon,
                  title: Text(listTodo.elementAt(posisi).title), //title widget
                  subtitle: Text(
                      listTodo.elementAt(posisi).subtitle), //subtitle widget
                );
              },
            ),
          ),
          Container(
            child: ListView.builder(
              itemCount: listTodo.length,
              itemBuilder: (context, posisi) {
                return ListTile(
                  leading: listTodo.elementAt(posisi).circleIcon,
                  title: Text(listTodo.elementAt(posisi).title), //title widget
                  subtitle: Text(listTodo.elementAt(posisi).subtitle),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Es Teh Manis 1");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DataTodo {
  String title;
  String subtitle;
  Widget circleIcon;
  DataTodo({this.title, this.subtitle, this.circleIcon});
}

// class DataTodo {
//   String title;
//   String subtitle;
//   Widget circleIcon;
//   DataTodo({this.title, this.subtitle, this.circleIcon});
// }