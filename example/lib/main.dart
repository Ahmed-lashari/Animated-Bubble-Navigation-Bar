import 'package:animated_bubble_navigation_bar/animated_bubble_navigation_bar.dart';
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
    return SafeArea(
      child: Scaffold(
        body: AnimatedBubbleNavBar(
          screens: [
            Screen1(),
            Screen2(),
            Screen3(),
          ],
          menuItems: [
            BubbleItem(lable: "Home", icon: Icons.home),
            BubbleItem(lable: "Settings", icon: Icons.settings),
            BubbleItem(lable: "Profile", icon: Icons.person),
          ],
          bubbleDecoration: BubbleDecoration(
            // Colors
            selectedBubbleBackgroundColor: Colors.white70,
            unSelectedBubbleBackgroundColor: Colors.deepPurple,
            selectedBubbleLabelColor: Colors.black87,
            unSelectedBubbleLabelColor: Colors.white70,
            selectedBubbleIconColor: Colors.black87,
            unSelectedBubbleIconColor: Colors.white70,
            backgroundColor: Colors.deepPurpleAccent,

            // Text
            labelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal),

            // Icon
            iconSize: 30,
            innerIconLabelSpacing: 5,
            bubbleItemSize: 30,

            // Behavior & Animation
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 300),
            physics: const BouncingScrollPhysics(),
            screenTransitionDuration: Duration(seconds: 1),
            screenTransitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
                    .animate(animation),
                child: child,
              );
            },

            // Padding & Margin
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),

            // Layout & Shape
            bubbleAlignment: BubbleAlignment.bottomCenter,
            shapes: BubbleShape.square,
            squareBordersRadius: 50,
          ),
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Text("Screen 1"),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Text("Screen 2"),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Text("Screen 3"),
    );
  }
}
