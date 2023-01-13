import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

List<User> players = [];

class _MyHomePageState extends State<MyHomePage> {
  Future<String> writeData() async {
    return await rootBundle.loadString("user.json").then(
      (value) {
        log("json data $value");
        return value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: SizedBox(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: writeData,
              child: Text(
                "Write",
              ),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text(
                "Read",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<User?>? userFromJson(String str) => json.decode(str) == null
    ? []
    : List<User?>.from(json.decode(str)!.map((x) => User.fromJson(x)));

String userToJson(List<User?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class User {
  User({
    required this.username,
    required this.password,
  });

  String? username;
  String? password;

  User copyWith({
    String? username,
    String? password,
  }) =>
      User(
        username: username ?? this.username,
        password: password ?? this.password,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
