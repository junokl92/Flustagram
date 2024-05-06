// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ReelPage extends StatefulWidget {
  const ReelPage({super.key});

  @override
  State<ReelPage> createState() => _ReelPageState();
}

class _ReelPageState extends State<ReelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Reel Page")));
  }
}
