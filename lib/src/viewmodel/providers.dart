import 'package:flutter/material.dart';

/// Flutter default Notifier to keep track of the selected index.
/// This is used to update the UI when the selected index changes.
/// It is initialized with 0, which means the first item is selected by default.
/// You can change the initial value to select a different item by default.
/// This notifier is used in the [AnimatedBubbleNavBar] to update the selected index
/// and rebuild the UI when the selected index changes.
final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);
