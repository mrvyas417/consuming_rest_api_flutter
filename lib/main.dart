// ignore_for_file: avoid_print, prefer_const_constructors, unused_local_variable

import 'dart:convert';

import 'package:consuming_api_model_class/model/complex_data.dart';
import 'package:consuming_api_model_class/model/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loading = true;
  Data data = Data();
  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consuming API',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (data.username != null) ...{
                Text("username is ${data.username}"),
              },
              Visibility(
                child: CircularProgressIndicator(),
                visible: loading,
              )
            ],
          ),
        ),
      ),
    );
  }

  getdata() async {
    getComplex();
    setState(() {
      loading = true;
    });
    var url = "https://shubham-vyas.herokuapp.com/api/v1/instagram";
    var res = await http.get(Uri.parse(url));
    final resDecdode = jsonDecode(res.body);
    data = Data.fromMap(resDecdode);
    loading = false;
    print(data.username);
    setState(() {});
  }
}

getComplex() async {
  await Future.delayed(Duration(seconds: 2));
  final getData = await rootBundle.loadString("assets/data.json");
  final decodedData = jsonDecode(getData);
  var complexdata = ComplexData.fromMap(decodedData);
  print(complexdata.skills!.ostype![1].title);
  // for (int i = 0; i < complexdata.skills!.ostype!.length; i++) {
  //   print("with lopping ${complexdata.skills!.ostype![i].title}");
  // }
  for (int i = 0; i < complexdata.skills!.vtitle!.length; i++) {
    print("with lopping ${complexdata.skills!.vtitle![i].vtitle}");
  }
  print(complexdata.skills!.javascript);
}
