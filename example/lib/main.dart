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
    return const MaterialApp(
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
  final List<Widget> _screens = const [
    KeepAliveWrapper(child: Screen1()),
    KeepAliveWrapper(child: Screen2()),
    KeepAliveWrapper(child: Screen3()),
  ];

  final List<BubbleItem> _menuItems = const [
    BubbleItem(icon: Icons.home_outlined, label: "Home"),
    BubbleItem(icon: Icons.settings_outlined, label: "Settings"),
    BubbleItem(icon: Icons.person_outline, label: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedBubbleNavBar(
          screens: _screens,
          menuItems: _menuItems,
          initialIndex: 0,

          /// This is the main decoration for the bubbles in the navigation bar.
          /// You can customize colors, text styles, icon sizes, animations, and more.
          /// For more details, refer to the documentation.
          bubbleDecoration: BubbleDecoration(
            // Colors
            backgroundColor: const Color(0xFFEDE7F6),
            selectedBubbleBackgroundColor: const Color(0xFFF8BBD0),
            unSelectedBubbleBackgroundColor: const Color(0xFFCE93D8),
            selectedBubbleLabelColor: Colors.black87,
            unSelectedBubbleLabelColor: Colors.white,
            selectedBubbleIconColor: Colors.black87,
            unSelectedBubbleIconColor: Colors.black45,

            // Text
            selectedBubbleLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal),

            unSelectedBubbleLabelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),

            // Icon
            iconSize: 30,
            innerIconLabelSpacing: 5,

            // Behavior & Animation
            curveIn: Curves.easeIn,
            bubbleDuration: const Duration(milliseconds: 300),
            physics: const BouncingScrollPhysics(),

            // Screen Transition
            screenTransitionDuration: const Duration(milliseconds: 300),
            screenTransitionBuilder: (child, animation) {
              return SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                        .animate(animation),
                child: child,
              );
            },

            // Padding & Margin
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),

            // Layout & Shape
            bubbleItemSize: 20,
            axis: Axis.horizontal,
            alignment: Alignment.bottomCenter,
            shapes: BubbleShape.circular,
            squareBordersRadius: 20,
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
    debugPrint("Screen 1 built");
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
          child: Text(
        "Screen 1",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Screen 2 built");
    return const Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
          child: Text(
        "Screen 2",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Screen 3 built");
    return const Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
          child: Text(
        "Screen 3",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }
}

/// A wrapper widget to keep the state of the child widget alive
/// optional but recommended for better performance
/// when using AnimatedBubbleNavBar without screen-transition-builder.
class KeepAliveWrapper extends StatefulWidget {
  final Widget child;
  const KeepAliveWrapper({super.key, required this.child});

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
