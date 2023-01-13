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
  var ct1 = TextEditingController();
  String imageLink = "";

  @override
  Widget build(BuildContext context) {
    ct1.addListener(() {
      setState(() {
        imageLink = ct1.text;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: ct1,
              decoration: const InputDecoration(
                labelText: "Full Image Path",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Image.network(
            imageLink,
            errorBuilder: (context, error, stackTrace) {
              return const Text("Image path invalid");
            },
          ),
        ],
      ),
    );
  }
}
