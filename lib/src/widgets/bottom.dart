import 'package:flutter/material.dart';

typedef ValueChanged = void Function(int);

class MapsBottomNavigationBar extends StatefulWidget {
  const MapsBottomNavigationBar({
    Key key,
    this.onChange,
  }) : super(key: key);

  final ValueChanged onChange;

  @override
  _MapsBottomNavigationBarState createState() => _MapsBottomNavigationBarState();
}

class _MapsBottomNavigationBarState extends State<MapsBottomNavigationBar> {
  final Map<String, IconData> _items = {
    'Explore': Icons.location_pin,
    'Go': Icons.directions_bus,
    'Saved': Icons.bookmark_outline,
    'Contribute': Icons.add_circle_outline,
    'Updates': Icons.notifications_none_outlined,
  };

  int _controller = 0;

  void handleChange(int index) {
    setState(() => _controller = index);
    if (widget.onChange != null) {
      widget.onChange(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _controller,
      type: BottomNavigationBarType.fixed,
      items: _items.entries.map((e) {
        return BottomNavigationBarItem(
          icon: Icon(e.value),
          label: e.key,
        );
      }).toList(),
      onTap: handleChange,
    );
  }
}
