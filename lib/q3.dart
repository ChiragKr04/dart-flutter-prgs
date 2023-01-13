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
  var ct2 = TextEditingController();

  String difference = "";
  String product = "";
  String quotient = "";

  void compute() {
    try {
      setState(() {
        difference =
            "Difference = ${int.parse(ct1.text) - int.parse(ct2.text)}";
        product = "Product = ${int.parse(ct1.text) * int.parse(ct2.text)}";
        quotient = "Quotient = ${int.parse(ct1.text) / int.parse(ct2.text)}";
      });
    } catch (e) {
      print("Error computing $e");
    }
  }

  Widget myText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 21,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: ct1,
                decoration: const InputDecoration(
                  labelText: "First Number",
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: ct2,
                  decoration: const InputDecoration(
                    labelText: "Second Number",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              myText(difference),
              myText(product),
              myText(quotient),
              ElevatedButton(
                onPressed: compute,
                child: Text(
                  "COMPUTE",
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
