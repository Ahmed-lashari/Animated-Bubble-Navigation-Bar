import 'package:flutter/material.dart';
import '../../../animated_bubble_navigation_bar.dart';
import '../../core/utils/utils.dart';
import 'bubble_ui.dart';

/// A widget that provides an animated bubble navigation bar.
/// It works as the Bottom Navigation Bar or as the Tab Bar as well.
class AnimatedBubbleNavBar extends StatelessWidget {
  /// Constructor for the AnimatedBubbleNavBar widget.
  /// It takes a list of screens, menu items, bubble decoration, and an initial index.
  /// The [screens] and [menuItems] must not be empty.
  /// The [bubbleDecoration] is used to customize the appearance of the bubbles.
  /// The [initialIndex] is the index of the screen to be displayed initially.
  /// It validates the arguments passed to the widget and initializes the selected index notifier.
  AnimatedBubbleNavBar(
      {super.key,
      required this.screens,
      required this.menuItems,
      this.bubbleDecoration = const BubbleDecoration(),
      this.initialIndex = 0})
      : super() {
    /// Validating the arguments passed to the AnimatedBubbleNavBar.
    Utils.validateNavBarArguments(
        screens: screens, menuItems: menuItems, initialIndex: initialIndex);
    selectedIndexNotifier.value = initialIndex;
  }

  /// The screens to be displayed in the navigation bar.
  final List<Widget> screens;

  /// The menu items to be displayed in the navigation bar.
  final List<BubbleItem> menuItems;

  /// The decoration for the bubbles in the navigation bar.
  final BubbleDecoration bubbleDecoration;

  /// The initial index to be selected in the navigation bar.
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    final align = bubbleDecoration.alignment;
    if (menuItems.isEmpty && screens.isEmpty) {
      return const SizedBox.shrink();
    }

    return Stack(children: [
      _buildBodyWidgets(align, bubbleDecoration.bubbleItemSize),
      _buildNavBar(align)
    ]);
  }

  /// Notifier to keep track of the selected index.
  /// This is used to update the UI when the selected index changes.
  Widget _buildBodyWidgets(Alignment align, double height) {
    return Positioned.fill(
      child: ValueListenableBuilder<int>(
          valueListenable: selectedIndexNotifier,
          builder: (context, selectedIndex, _) => _buildScreens(selectedIndex)),
    );
  }

  /// Builds the navigation bar at the specified alignment.
  /// The [align] determines alignment of the navigation bar.
  /// The [CustomBubbleNavBar] widget is used to create the navigation bar.
  /// The [bubbleDecoration] is used to customize the appearance of the bubbles.
  /// The [menuItems] are the items to be displayed in the navigation bar.
  Widget _buildNavBar(Alignment align) {
    final position = Utils.getNavBarPosition(align);
    return Positioned(
        top: position.top,
        left: position.left,
        right: position.right,
        bottom: position.bottom,
        child: CustomBubbleNavBar(
            items: menuItems, bubbleDecoration: bubbleDecoration));
  }

  /// Default transition builder for screen transitions.
  /// This is used when no custom transition builder is provided.
  /// It creates a [FadeTransition] with the given animation.
  Widget Function(Widget, Animation<double>) _defaultTransitionBuilder() {
    return (child, animation) {
      return FadeTransition(opacity: animation, child: child);
    };
  }

  /// Builds the stacked screens based on the selected index without any transition.
  Widget _buildScreens(final int selectedIndex) {
    final transitionBuilder = bubbleDecoration.screenTransitionBuilder;
    final duration = bubbleDecoration.screenTransitionDuration;

    if (transitionBuilder == null && duration == null) {
      return IndexedStack(
        index: selectedIndex,
        children: screens,
      );
    }

    return _buildScreenTransitionAnimation(selectedIndex);
  }

  /// Builds the screen transition animation based on the selected index.
  Widget _buildScreenTransitionAnimation(final int selectedIndex) {
    final transitionBuilder = bubbleDecoration.screenTransitionBuilder;
    final duration = bubbleDecoration.screenTransitionDuration;
    final curveIn = bubbleDecoration.curveIn;
    final curveOut = bubbleDecoration.curveOut;
    return AnimatedSwitcher(
        duration: duration ?? const Duration(milliseconds: 300),
        switchInCurve: curveIn,
        switchOutCurve: curveOut,
        transitionBuilder: transitionBuilder ?? _defaultTransitionBuilder(),
        child: KeyedSubtree(
          key: ValueKey<int>(selectedIndex),
          child: screens[selectedIndex],
        ));
  }
}
