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

  String celsicus = "";
  String farh = "";

  void toCelcius() {
    try {
      setState(() {
        celsicus = "Celsicus = ${(int.parse(ct1.text) - 32) * 5 / 9}";
        farh = '';
      });
    } catch (e) {
      print("Error computing $e");
    }
  }

  void toFarhn() {
    try {
      setState(() {
        farh = "Fahrenheit = ${(int.parse(ct1.text) * (9 / 5)) + 32}";
        celsicus = '';
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
                  labelText: "Enter Number",
                  border: OutlineInputBorder(),
                ),
              ),
              myText(celsicus),
              myText(farh),
              ElevatedButton(
                onPressed: toCelcius,
                child: Text(
                  "Computer to Celcius",
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: toFarhn,
                child: Text(
                  "Computer to Fahrenheit",
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
