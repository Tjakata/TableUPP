import 'package:flutter/material.dart';
import 'package:tableupp/tables/available_tables.dart';
import 'package:tableupp/utils/activity.dart';

import '../profile_screens/profiles.dart';
import '../profile_screens/settings.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int) onIndexChanged;
  final int selectedIndex;
  final BuildContext context;

  const BottomNavBar({
    Key? key,
    required this.onIndexChanged,
    required this.selectedIndex,
    required this.context,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  Color _iconColor(int index) {
    return widget.selectedIndex == index ? Colors.green : Colors.grey;
  }

  void _navigateToScreen(int index) {
    widget.onIndexChanged(index);
    switch (index) {
      case 0:
        Navigator.push(widget.context, MaterialPageRoute(builder: (context) => AvailableTablesScreen()));
        break;
      case 1:
        Navigator.push(widget.context, MaterialPageRoute(builder: (context) => ActivityScreen()));
        break;
      case 2:
        // Navigator.push(widget.context, MaterialPageRoute(builder: (context) => AddNewScreen()));
        break;
      case 3:
        Navigator.push(widget.context, MaterialPageRoute(builder: (context) => ProfilePageScreen()));
        break;
      case 4:
        Navigator.push(widget.context, MaterialPageRoute(builder: (context) => SettingsScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: Colors.white,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Left Side
            Row(
              children: [
                IconButton(
                  icon: Column(
                    children: [
                      Icon(Icons.table_chart, color: _iconColor(0)),
                      Text('Available Tables', style: TextStyle(fontSize: 10, color: _iconColor(0))),
                    ],
                  ),
                  onPressed: () => _navigateToScreen(0),
                ),
                IconButton(
                  icon: Column(
                    children: [
                      Icon(Icons.mail_outline, color: _iconColor(1)),
                      Text('Activity', style: TextStyle(fontSize: 10, color: _iconColor(1))),
                    ],
                  ),
                  onPressed: () => _navigateToScreen(1),
                ),
              ],
            ),
            // Center FAB
            FloatingActionButton(
              onPressed: () => _navigateToScreen(2),
              backgroundColor: Colors.green,
              child: const Icon(Icons.add, color: Colors.white, size: 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            // Right Side
            Row(
              children: [
                IconButton(
                  icon: Column(
                    children: [
                      Icon(Icons.person_outline, color: _iconColor(3)),
                      Text('Profile', style: TextStyle(fontSize: 10, color: _iconColor(3))),
                    ],
                  ),
                  onPressed: () => _navigateToScreen(3),
                ),
                IconButton(
                  icon: Column(
                    children: [
                      Icon(Icons.settings_outlined, color: _iconColor(4)),
                      Text('Settings', style: TextStyle(fontSize: 10, color: _iconColor(4))),
                    ],
                  ),
                  onPressed: () => _navigateToScreen(4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}