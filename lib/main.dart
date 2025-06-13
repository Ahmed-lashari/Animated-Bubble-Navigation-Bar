import 'package:animated_bubble_navigation_bar/ui/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedBubbleBottombarPackage());
}

class AnimatedBubbleBottombarPackage extends StatefulWidget {
  const AnimatedBubbleBottombarPackage({super.key});

  @override
  State<AnimatedBubbleBottombarPackage> createState() =>
      _AnimatedBubbleBottombarPackageState();
}

class _AnimatedBubbleBottombarPackageState
    extends State<AnimatedBubbleBottombarPackage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
