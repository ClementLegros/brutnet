import 'package:flutter/material.dart';

class MyHomePageMobile extends StatefulWidget {
  const MyHomePageMobile({Key? key}) : super(key: key);

  @override
  State<MyHomePageMobile> createState() => _MyHomePageMobileState();
}

class _MyHomePageMobileState extends State<MyHomePageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Mobile"),
      ),
    );
  }
}