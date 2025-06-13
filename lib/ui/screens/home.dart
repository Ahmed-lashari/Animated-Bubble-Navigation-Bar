import 'package:animated_bubble_navigation_bar/core/entities/enums/alignemnts.dart';
import 'package:animated_bubble_navigation_bar/core/entities/enums/shapes.dart';
import 'package:animated_bubble_navigation_bar/core/model/bottom_nav_bar_decoration.dart';
import 'package:animated_bubble_navigation_bar/ui/screens/screen1.dart';
import 'package:animated_bubble_navigation_bar/ui/screens/screen2.dart';
import 'package:animated_bubble_navigation_bar/ui/screens/screen3.dart';
import 'package:flutter/material.dart';

import '../../core/model/bottom_nav_item.dart';
import '../widgets/bottom_nav_bar_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white70,
            body: AnimatedBubbleNavBottomBar(
              screens: [Screen1(), Screen2(), Screen4(), Screen5(), Screen3()],
              menuItems: [
                BottomNavItem(lable: "Home"),
                BottomNavItem(lable: "Settings"),
                BottomNavItem(lable: "Chats"),
                BottomNavItem(lable: "Dashboard"),
                BottomNavItem(lable: "Person")
              ],
              bobbleDecoration: BubbleDecoration(
                  bubbleAlignment: BubbleAlignment.bottomCenter,
                  bubbleItemSize: 20,
                  squareBordersRadius: 20,
                  shapes: BubbleShape.square,
                  backgroundColor: Color(0xFFF1F8E9), // minty light green

                  selectedBubbleBackgroundColor:
                      Color(0xFF43A047), // rich matcha green
                  unSelectedBubbleBackgroundColor:
                      Color(0xFFC8E6C9), // light mint green

                  selectedBubbleIconColor: Colors.white,
                  unSelectedBubbleIconColor:
                      Color(0xFF689F38), // lime-ish green

                  selectedBubbleLabelColor: Colors.white,
                  unSelectedBubbleLabelColor: Color(0xFF33691E), // deep moss
                  labelStyle: TextStyle(fontSize: 16)),
            )));
  }
}
