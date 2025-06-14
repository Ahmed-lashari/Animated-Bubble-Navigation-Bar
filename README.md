# 🫧 Animated Bubble Navigation Bar

A **lightweight**, **customizable**, and **responsive** bottom navigation bar for Flutter with smooth bubble animations.

Perfect for modern apps with stylish transitions, adaptive layouts, and full customization.

---

## ✨ Features

* 🔹 Clean, modern design
* 🫧 Bubble-style animations
* 🛠 Fully customizable (icons, labels, colors, shape)
* 🔁 Seamless tab switching
* 📱 Responsive across devices (phones & tablets)
* 🧩 Easy integration & minimal setup

---

## 📸 Preview

| Demo                          | Preview                                                                                                                                 |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| 💡 Default Bubble Animation   | ![default](https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/raw/main/assets/bubble_shapes/default-bubble.gif?raw=true)   |
| 🎨 Custom Icons & Labels      | ![custom](https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/raw/main/assets/bubble_shapes/bubble-items.gif?raw=true)      |
| 📱 Responsive Across Devices  | ![responsive](https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/raw/main/assets/bubble_shapes/bubble-shapes.gif?raw=true) |
| 🔁 Seamless Tab Switching     | ![seamless](https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/raw/main/assets/bubble_shapes/clean-square.gif?raw=true)    |
| 🧱 Square/Alternative Layouts | ![square](https://github.com/Ahmed-lashari/Animated-Bubble-Navigation-Bar/raw/main/assets/bubble_shapes/square-bubbles.gif?raw=true)    |

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
  body: AnimatedBubbleNavBottomBar(
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
    bobbleDecoration: BubbleDecoration(), // Decoration
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
  iconSize: 28,

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
| `bobbleDecoration` | `BubbleDecoration` (optional) | Custom animation, colors, shapes, etc. |

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