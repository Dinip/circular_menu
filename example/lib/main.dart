import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _colorName = 'No';
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Flutter Circular Menu'),
        ),
        body: Floating(
          child: Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 28),
                children: <TextSpan>[
                  TextSpan(
                    text: _colorName,
                    style: TextStyle(color: _color, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' button is clicked.'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Floating extends StatefulWidget {
  Floating({
    super.key,
    required this.child,
  });

  Widget child;

  @override
  State<Floating> createState() => _FloatingState();
}

class _FloatingState extends State<Floating> {
  late OverlayEntry _overlayEntry;
  Alignment _alignment = Alignment.bottomCenter;
  Alignment _alignment2 = Alignment.bottomCenter;

  @override
  void initState() {
    super.initState();
    _showOverlay();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(_overlayEntry);
    });
  }

  @override
  void dispose() {
    _overlayEntry.remove();
    super.dispose();
  }

  void _showOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onPanUpdate: (details) {
          _alignment += Alignment(
            details.delta.dx / (MediaQuery.of(context).size.width / 2),
            details.delta.dy / (MediaQuery.of(context).size.height / 2),
          );
          _alignment2 = _roundToNearestValidCoordinate(_alignment);
          _overlayEntry.markNeedsBuild();
        },
        child: CircularMenu(
          alignAnimationDuration: Duration(milliseconds: 150),
          alignment: _alignment2,
          toggleButtonColor: Colors.pink,
          items: [
            CircularMenuItem(
              icon: Icons.home,
              color: Colors.green,
              onTap: () {
                setState(() {});
              },
            ),
            CircularMenuItem(
              icon: Icons.search,
              color: Colors.blue,
              onTap: () {
                setState(() {});
              },
            ),
            CircularMenuItem(
              icon: Icons.settings,
              color: Colors.orange,
              onTap: () {
                setState(() {});
              },
            ),
            CircularMenuItem(
              icon: Icons.chat,
              color: Colors.purple,
              onTap: () {
                setState(() {});
              },
            ),
            CircularMenuItem(
              icon: Icons.notifications,
              color: Colors.brown,
              onTap: () {
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return this.widget.child;
  }

  Alignment _roundToNearestValidCoordinate(Alignment alignment) {
    List<double> validXValues = [-1, -0.5, 0.0, 0.5, 1.0];
    List<double> validYValues = [-1, -0.8, -0.6, -0.4, -0.2, 0.0, 0.2, 0.4, 0.6, 0.8, 1.0];

    double roundedX = validXValues.reduce((a, b) => (alignment.x - a).abs() < (alignment.x - b).abs() ? a : b);
    if (roundedX != -1.0 && roundedX != 1.0) {
      if (alignment.x < 0) {
        roundedX = -1.0;
      } else {
        roundedX = 1.0;
      }
    }

    double roundedY = validYValues.reduce((a, b) => (alignment.y - a).abs() < (alignment.y - b).abs() ? a : b);

    return Alignment(roundedX, roundedY);
  }
}
