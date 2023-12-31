import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  HomeBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final List<Map<String, dynamic>> navigationItems = [
    {
      'icon': Icons.home,
      'label': 'Home',
      'route': '/portfolio_gallery',
    },
    {
      'icon': Icons.filter_alt_rounded,
      'label': 'Filter',
      'route': '/filter',
    },
    {
      'icon': Icons.settings,
      'label': 'Config',
      'route': '/config',
    },
    {
      'icon': Icons.mail_rounded,
      'label': 'Message',
      'route': '/message',
    },
    {
      'icon': Icons.person,
      'label': 'Profile',
      'route': '/profile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: navigationItems.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(item['icon']),
          label: item['label'],
        );
      }).toList(),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    String route = navigationItems[index]['route'];
    context.go(route);
  }
}
