import 'package:flutter/material.dart';

class MyHomePageTablet extends StatefulWidget {
  const MyHomePageTablet({Key? key}) : super(key: key);

  @override
  State<MyHomePageTablet> createState() => _MyHomePageTabletState();
}

class _MyHomePageTabletState extends State<MyHomePageTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Tablet")
      ),
    );
  }
}