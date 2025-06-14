import 'package:animated_bubble_navigation_bar/animated_bubble_navigation_bar.dart';
import 'package:animated_bubble_navigation_bar/src/core/entities/enums/alignemnts.dart';
import 'package:animated_bubble_navigation_bar/src/core/entities/enums/shapes.dart';
import 'package:animated_bubble_navigation_bar/src/model/bottom_nav_bar_decoration.dart';
import 'package:animated_bubble_navigation_bar/src/model/bottom_nav_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBubbleNavBottomBar(
        screens: [
          // Screen1(),
          // Screen2(),
          // Screen3(),
        ],
        menuItems: [
          BubbleItem(lable: "Home"),
          BubbleItem(lable: "Settings"),
          BubbleItem(lable: "Profile"),
        ],
        bubbleDecoration: BubbleDecoration(
          selectedBubbleBackgroundColor: Colors.white70,
          unSelectedBubbleBackgroundColor: Colors.deepPurple,
          selectedBubbleLabelColor: Colors.black87,
          unSelectedBubbleLabelColor: Colors.white70,
          selectedBubbleIconColor: Colors.black87,
          unSelectedBubbleIconColor: Colors.white70,
          labelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal),
          iconSize: 30,
          backgroundColor: Colors.deepPurpleAccent,
          innerIconLabelSpacing: 5,
          bubbleItemSize: 10,
          physics: const BouncingScrollPhysics(),
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          curve: Curves.easeIn,
          bubbleAlignment: BubbleAlignment.bottomCenter,
          shapes: BubbleShape.circular,
          squareBordersRadius: 50,
        ),
      ),
    );
  }
}
