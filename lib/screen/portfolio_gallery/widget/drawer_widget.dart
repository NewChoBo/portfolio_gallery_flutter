import 'package:flutter/material.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Sidebar'),
          ),
          ListTile(
            title: const Text('첫번째 메뉴'),
            onTap: () {
              // TODO: Do something when the menu item is clicked
            },
          ),
          ListTile(
            title: const Text('Menu Item 2'),
            onTap: () {
              // TODO: Do something when the menu item is clicked
            },
          ),
        ],
      ),
    );
  }
}
