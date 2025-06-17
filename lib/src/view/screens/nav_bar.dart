import 'package:flutter/material.dart';
import '../../../animated_bubble_navigation_bar.dart';
import '../../core/utils/utils.dart';
import 'bubble_ui.dart';

class AnimatedBubbleNavBar extends StatelessWidget {
  final List<Widget> screens;
  final List<BubbleItem> menuItems;
  final BubbleDecoration bubbleDecoration;
  final int initialIndex;

  AnimatedBubbleNavBar(
      {super.key,
      required this.screens,
      required this.menuItems,
      this.bubbleDecoration = const BubbleDecoration(),
      this.initialIndex = 0})
      : super() {
    Utils.validateNavBarArguments(
        screens: screens, menuItems: menuItems, initialIndex: initialIndex);
    selectedIndexNotifier.value = initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final align = bubbleDecoration.bubbleAlignment.alignment;
    if (menuItems.isEmpty && screens.isEmpty) {
      return SizedBox.shrink();
    }

    return Stack(children: [
      _buildBodyWidgets(align, bubbleDecoration.bubbleItemSize),
      _buildNavBar(align)
    ]);
  }

  Widget _buildBodyWidgets(Alignment align, double height) {
    return Positioned.fill(
      child: ValueListenableBuilder<int>(
        valueListenable: selectedIndexNotifier,
        builder: (context, selectedIndex, _) {
          return (bubbleDecoration.screenTransitionDuration != null)
              ? AnimatedSwitcher(
                  duration: bubbleDecoration.screenTransitionDuration!,
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  transitionBuilder: bubbleDecoration.screenTransitionBuilder ??
                      _defaultTransitionBulder(),
                  child: KeyedSubtree(
                    key: ValueKey<int>(selectedIndex),
                    child: screens[selectedIndex],
                  ))
              : Stack(
                  children: List.generate(screens.length, (index) {
                    return Offstage(
                      offstage: selectedIndex != index,
                      child: TickerMode(
                        enabled: selectedIndex == index,
                        child: screens[index],
                      ),
                    );
                  }),
                );
        },
      ),
    );
  }

  Widget _buildNavBar(Alignment align) {
    final position = Utils.getNavBarPosition(align);
    return Positioned(
        top: position.top,
        left: position.left,
        right: position.right,
        bottom: position.bottom,
        child: CustomBottomNavBar(
            items: menuItems, bobbleDecoration: bubbleDecoration));
  }

  Widget Function(Widget, Animation<double>) _defaultTransitionBulder() {
    return (child, animation) {
      return FadeTransition(opacity: animation, child: child);
    };
  }
}
