// ignore_for_file: prefer_const_constructors, unnecessary_this, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_insta/create_post_page.dart';
import 'package:flutter_insta/home_page.dart';
import 'package:flutter_insta/profile_page.dart';
import 'package:flutter_insta/reel_page.dart';
import 'package:flutter_insta/search_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 140, 179)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final List pages = [
    HomePage(),
    SearchPage(),
    CreatePostPage(),
    ReelPage(),
    ProfilePage()
  ];

  void updatePageIndex(value) {
    setState(() {
      this.currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined), label: "Post"),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation_outlined), label: "Reel"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: "Profile")
          ],
          currentIndex: this.currentIndex,
          onTap: this.updatePageIndex,
        ));
  }
}
