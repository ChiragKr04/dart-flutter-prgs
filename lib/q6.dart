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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: InkWell(
                onTap: () {
                  print("Card 1 tapped");
                },
                child: Card(
                  elevation: 10,
                  child: Center(child: Text("Card 1")),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: InkWell(
                onTap: () {
                  print("Card 2 tapped");
                },
                child: Card(
                  elevation: 10,
                  child: Center(child: Text("Card 2")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
