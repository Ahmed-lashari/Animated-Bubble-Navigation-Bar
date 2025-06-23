# 🫧 Animated Bubble Navigation Bar

A **lightweight**, **customizable**, and **responsive** navigation bar for Flutter with smooth bubble animations.

Perfect for modern apps with stylish transitions, adaptive layouts, and full customization.

---


## 📸 Bubble Preview

| Demo                          | Preview                                                                                                                                 |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| 💡 Default Bubble Animation   | ![default](https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/raw/main/assets/bubble_shapes/default-bubble.gif?raw=true)   |
| 🎨 Custom Icons & Labels      | ![custom](https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/raw/main/assets/bubble_shapes/bubble-items.gif?raw=true)      |
| 📱 Responsive Across Devices  | ![responsive](https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/raw/main/assets/bubble_shapes/bubble-shapes.gif?raw=true) |
| 🔁 Seamless Tab Switching     | ![seamless](https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/raw/main/assets/bubble_shapes/clean-square.gif?raw=true)    |
| 🧱 Square/Alternative Layouts | ![square](https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/raw/main/assets/bubble_shapes/square-bubbles.gif?raw=true)    |

---

## 📸 Navigation Preview with Code

### 💡 Scaling + Fading and Sliding

<table>
<tr>
<td>

```dart
screenTransitionBuilder: (child, animation) {
  final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutExpo);
  return FadeTransition(
    opacity: curved,
    child: ScaleTransition(
      scale: Tween<double>(begin: 0.95, end: 1).animate(curved),
      child: SlideTransition(
        position: Tween<Offset>(begin: Offset(0.1, 0.1), end: Offset.zero)
            .animate(curved),
        child: child,
      ),
    ),
  );
},
```

</td>
<td>
<img src="https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/blob/main/assets/navigation_transitions/1.gif?raw=true" width="250"/>
</td>
</tr>
</table>

---

### 🎨 Flip + Fade

<table>
<tr>
<td>

```dart
screenTransitionBuilder: (child, animation) {
  final rotate = Tween<double>(begin: 1, end: 0).animate(animation);
  return AnimatedBuilder(
    animation: rotate,
    builder: (context, childWidget) {
      final isUnder = (rotate.value > 0.5);
      final angle = (1 - rotate.value) * 3.14;
      return Transform(
        transform: Matrix4.rotationY(angle),
        alignment: Alignment.center,
        child: Opacity(
          opacity: isUnder ? 0.5 : 1,
          child: childWidget,
        ),
      );
    },
    child: child,
  );
},
```

</td>
<td>
<img src="https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/blob/main/assets/navigation_transitions/2.gif?raw=true" width="250"/>
</td>
</tr>
</table>

---

### 📱 Blur & Fade

<table>
<tr>
<td>

```dart
screenTransitionBuilder: (child, animation) {
  return FadeTransition(
    opacity: animation,
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: (1 - animation.value) * 10,
        sigmaY: (1 - animation.value) * 10,
      ),
      child: child,
    ),
  );
},
```

</td>
<td>
<img src="https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/blob/main/assets/navigation_transitions/3.gif?raw=true" width="250"/>
</td>
</tr>
</table>

---

### 🔁 Slide + Elastic

<table>
<tr>
<td>

```dart
screenTransitionBuilder: (child, animation) {
    final curved =
        CurvedAnimation(parent: animation, curve: Curves.elasticOut);
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(curved),
      child: child,
    );
  },
```

</td>
<td>
<img src="https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/blob/main/assets/navigation_transitions/4.gif?raw=true" width="250"/>
</td>
</tr>
</table>

---
#### To enable the transition effects, you must set the `screenTransitionDuration` (default is null, meaning no animation).

#### This duration activates the `screenTransitionBuilder` and controls how long the transition animation takes between screens.

---

> The transition effects are customizable and scalable — bring your creativity to craft even more stunning and futuristic animations tailored to your app's unique vibe.
## ✨ Features

* 🔹 Clean, modern design
* 🫧 Bubble-style animations
* 🛠 Fully customizable (icons, labels, colors, shape)
* 🔁 Seamless tab switching
* 📱 Responsive across devices (phones & tablets)
* 🧩 Easy integration & minimal setup

---

## 🚀 Getting Started

### 1️⃣ Add to `pubspec.yaml`

```yaml
dependencies:
  animated_bubble_navigation_bar: ^<latest_version>
```

### 2️⃣ Import the package

```dart
import 'package:animated_bubble_navigation_bar/animated_bubble_navigation_bar.dart';
```

### 3️⃣ Basic Usage

```dart
Scaffold(
  body: AnimatedBubbleNavBar(
    screens: [
      Screen1(),
      Screen2(),
      Screen3(),
    ],
    menuItems: [
      BottomNavItem(label: "Home", icon: Icons.home),
      BottomNavItem(label: "Settings", icon: Icons.settings),
      BottomNavItem(label: "Profile", icon: Icons.person),
    ],
    bubbleDecoration: BubbleDecoration(), // Decoration
  ),
);
```

---


### 4️⃣ Styling Colors and Icons

```dart
bubbleDecoration: BubbleDecoration(
  // Background color of the bar
  backgroundColor: Colors.deepPurple,

  // Bubble/Item colors
  selectedBubbleBackgroundColor: Colors.white,
  unSelectedBubbleBackgroundColor: Colors.grey.shade800,

  // Label colors
  selectedBubbleLabelColor: Colors.black,
  unSelectedBubbleLabelColor: Colors.white70,

  // Icon colors
  selectedBubbleIconColor: Colors.black,
  unSelectedBubbleIconColor: Colors.white,

  // Label style
  labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),

  // Icon size
  iconSize: 28
),

```

### 5️⃣ Advance Layout and Behavior

```dart
bubbleDecoration: BubbleDecoration(
  // Space between icon and label
  innerIconLabelSpacing: 6,

  // Size of bubble item container
  bubbleItemSize: 12,

  // Scrolling physics
  physics: BouncingScrollPhysics(),

  // Animation duration
  duration: Duration(milliseconds: 350),

  // Margin & padding
  margin: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),

  // Animation curve
  curve: Curves.easeInOutBack,

  // Bubble position (e.g., bottomCenter, bottomLeft, bottomRight)
  bubbleAlignment: BubbleAlignment.bottomCenter,

  // Shape of bubble (circular or square)
  shapes: BubbleShape.square,

  // Optional radius for square bubbles
  squareBordersRadius: 12,
),
```

---

## 📘 API Reference

| Property           | Type                          | Description                            |
| ------------------ | ----------------------------- | -------------------------------------- |
| `screens`          | `List<Widget>`                | Screens shown for each tab             |
| `menuItems`        | `List<BottomNavItem>`         | Navigation items (icon + label)        |
| `bobbleDecoration` | `BubbleDecoration` | Custom animation, colors, shapes, etc. |
| `initialIndex` | `int` | Initial index of the bubble in nav bar. |




### 🧩 `BottomNavItem`

Represents an item inside the custom bottom navigation bar. Used to define label and icon representation for each tab.

```dart
class BottomNavItem {
  final String lable;
  final Widget? iconWidget;
  final IconData? icon;

  const BottomNavItem({
    required this.lable,
    this.iconWidget,
    this.icon,
  });
}
```

| Property     | Type        | Description                                                                 |
| ------------ | ----------- | --------------------------------------------------------------------------- |
| `lable`      | `String`    | The text label shown under or beside the icon.                              |
| `icon`       | `IconData?` | Standard icon from Flutter’s `Icons` class. |
| `iconWidget` | `Widget?`   | A custom widget for the icon. Takes precedence after `icon`, if not provided.     |

> **Use case:** Allows flexibility to use either a Flutter `IconData` or a fully customized widget (like an SVG or image) for your bottom nav icons.

---

### 🎨 `BubbleDecoration`

Controls the visual appearance and animations of the entire bubble-style bottom navigation bar. Use this class to fully customize how each navigation item looks and behaves.

```dart
class BubbleDecoration {

  // Colors
  final Color selectedBubbleBackgroundColor;
  final Color unSelectedBubbleBackgroundColor;
  final Color selectedBubbleLabelColor;
  final Color unSelectedBubbleLabelColor;
  final Color selectedBubbleIconColor;
  final Color unSelectedBubbleIconColor;
  final Color backgroundColor;

  // Text
  final TextStyle labelStyle;

  // Icon
  final double iconSize;
  final double innerIconLabelSpacing;
  final double bubbleItemSize;

  // // Behavior & Animation
  final Curve curve;
  final Duration duration;
  final ScrollPhysics physics;
  final Duration? screenTransitionDuration;
  final AnimatedSwitcherTransitionBuilder? screenTransitionBuilder;

  // Margin & Padding
  final EdgeInsets margin;
  final EdgeInsets padding;

  // Layout & Shape
  final BubbleAlignment bubbleAlignment;
  final BubbleShape shapes;
  final double? squareBordersRadius;
}
```

#### 🎨 Colors

| Property                          | Type    | Description                                             |
| --------------------------------- | ------- | ------------------------------------------------------- |
| `selectedBubbleBackgroundColor`   | `Color` | Background color of the active (selected) bubble item.  |
| `unSelectedBubbleBackgroundColor` | `Color` | Background color of inactive (unselected) bubble items. |
| `selectedBubbleLabelColor`        | `Color` | Text color of the active item label.                    |
| `unSelectedBubbleLabelColor`      | `Color` | Text color of inactive item labels.                     |
| `selectedBubbleIconColor`         | `Color` | Icon color of the active bubble item.                   |
| `unSelectedBubbleIconColor`       | `Color` | Icon color of inactive bubble items.                    |
| `backgroundColor`                 | `Color` | Overall background color of the navigation bar.         |

#### 📝 Text

| Property     | Type        | Description                                  |
| ------------ | ----------- | -------------------------------------------- |
| `labelStyle` | `TextStyle` | Font size, weight, and style for all labels. |

#### 🖼️ Icon & Item Size

| Property                | Type     | Description                                                        |
| ----------------------- | -------- | ------------------------------------------------------------------ |
| `iconSize`              | `double` | Size of the icon inside each bubble.                               |
| `innerIconLabelSpacing` | `double` | Space between icon and label within a bubble item.                 |
| `bubbleItemSize`        | `double` | Used for layout spacing/scaling – affects visual balance of items. |

#### ⚙️ Behavior & Animation

| Property   | Type            | Description                                                         |
| ---------- | --------------- | ------------------------------------------------------------------- |
| `physics`  | `ScrollPhysics` | Defines how scrolling behaves if bar is scrollable.                 |
| `duration` | `Duration`      | Duration of animations when switching between items.                |
| `curve`    | `Curve`         | Animation curve used for transitions (e.g., `easeIn`, `bounceOut`). |
| `screenTransitionDuration`    | `Duration`         | Animation duration used for transitions between screens/tabs. |
| `screenTransitionBuilder`    | `Widget Function(Widget, Animation<double>)`         | Defines the animation used when switching between screens; defaults to a FadeTransition. |

> ⚙️ If `screenTransitionDuration` is `null` (default), screen/tab transitions will occur instantly without any animation.


#### 🧱 Padding & Margin

| Property  | Type         | Description                               |
| --------- | ------------ | ----------------------------------------- |
| `margin`  | `EdgeInsets` | External spacing around each bubble item. |
| `padding` | `EdgeInsets` | Internal spacing within each bubble item. |

#### 🔁 Layout & Shape

| Property              | Type              | Description                                                                |
| --------------------- | ----------------- | -------------------------------------------------------------------------- |
| `bubbleAlignment`     | `BubbleAlignment` | Defines how the nav bar is aligned (e.g., bottom ,left, right etc.).       |
| `shapes`              | `BubbleShape`     | Defines shape style – e.g., circular or square.                            |
| `squareBordersRadius` | `double?`         | This controls the Bubbles borders radius (corner roundness). |

---

## 🧱 Customization

* Icon & label styles
* Active/inactive colors
* Bubble shapes (rounded, square)
* Animation curve, duration, and more

---

## 🛤 Coming Soon

* 🔔 Badge support
* 🧭 Top TabBar support
* ➕ FAB (Notched) support
* 🌀 More animation styles

---

## 🧑‍💻 Developer

**Muhammad Ahmed Lashari**
[LinkedIn](https://www.linkedin.com/in/muhammad-ahmed-lashari-826761289/) | [GitHub](https://github.com/Ahmed-lashari) | 📧 [Email](mailto:ahmedlashari.official@gmail.com)

---

## 🤝 Contributing

We welcome contributions! To contribute:

1. Fork the repo
2. Create a new branch
3. Make your changes with proper testing
4. Open a PR with a clear description

For new features, open an issue first to discuss ideas before implementation.

---

## ⭐️ Support

If you find this package helpful:

* Leave a ⭐️ on GitHub
* Share with the Flutter community
* Submit feature requests or bug reports

---

Let’s build something beautiful — one bubble at a time! 🫧

---