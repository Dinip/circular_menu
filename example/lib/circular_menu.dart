import 'package:flutter/material.dart';
import 'package:draggable_circular_menu/draggable_circular_menu.dart';

class CircularMenuExample extends StatefulWidget {
  CircularMenuExample({
    super.key,
  });

  @override
  State<CircularMenuExample> createState() => _CircularMenuExampleState();
}

class _CircularMenuExampleState extends State<CircularMenuExample> {
  final GlobalKey<CircularMenuState> _circularMenuKey = GlobalKey<CircularMenuState>();
  String _colorName = 'No';
  Color _color = Colors.black;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CircularMenu(
      key: _circularMenuKey,
      alignAnimationDuration: Duration(milliseconds: 150),
      alignment: Alignment.bottomCenter,
      isDraggable: true,
      stepSize: (x: 1, y: 0.2),
      backgroundWidget: Center(
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
      toggleButtonColor: Colors.pink,
      items: [
        CircularMenuItem(
          icon: Icons.home,
          color: Colors.green,
          onTap: () {
            setState(() {
              _color = Colors.green;
              _colorName = 'Green';
            });
          },
        ),
        CircularMenuItem(
          icon: Icons.search,
          color: Colors.blue,
          onTap: () {
            setState(() {
              _color = Colors.blue;
              _colorName = 'Blue';
            });
          },
        ),
        CircularMenuItem(
          icon: Icons.settings,
          color: Colors.orange,
          onTap: () {
            setState(() {
              _color = Colors.orange;
              _colorName = 'Orange';
            });
          },
        ),
        CircularMenuItem(
          icon: Icons.chat,
          color: Colors.purple,
          onTap: () {
            setState(() {
              _color = Colors.purple;
              _colorName = 'Purple';
            });
          },
        ),
        CircularMenuItem(
          icon: Icons.notifications,
          color: Colors.brown,
          onTap: () {
            setState(() {
              _color = Colors.brown;
              _colorName = 'Brown';
            });
          },
        )
      ],
    );
  }
}
