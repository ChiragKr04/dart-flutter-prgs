import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDropped = false;
  String _color = "done";
  String imageLink = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Draggable<String>(
              // Data is the value this Draggable stores.
              data: _color,
              child: Container(
                height: 150.0,
                width: 150.0,
                color: Colors.redAccent,
                child: Center(
                  child: Image.asset(
                    "assets/images/mickey1.png",
                  ),
                ),
              ),
              feedback: Material(
                child: Container(
                  height: 170.0,
                  width: 170.0,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/mickey1.png",
                    ),
                  ),
                ),
              ),
              childWhenDragging: Container(
                height: 150.0,
                width: 150.0,
                color: Colors.grey,
                child: Center(
                  child: Image.asset(
                    "assets/images/mickey1.png",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            DragTarget<String>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                        height: 200,
                        width: 200,
                        color: _isDropped ? Colors.redAccent : null,
                        child: !_isDropped
                            ? Center(
                                child: Image.asset(
                                  "assets/images/mickey2.png",
                                ),
                              )
                            : Center(
                                child: Image.asset(
                                  "assets/images/mickey1.png",
                                ),
                              )),
                  ),
                );
              },
              onAccept: (data) {
                debugPrint('hi $data');
                setState(() {
                  _isDropped = true;
                });
              },
              onWillAccept: (data) {
                return data == _color;
              },
              onLeave: (data) {},
            ),
          ],
        ),
      ),
    ));
  }
}
