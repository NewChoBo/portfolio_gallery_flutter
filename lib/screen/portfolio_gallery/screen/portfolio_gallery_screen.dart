import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/screen/main/portfolio_main.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/widget/drawer_widget.dart';

class PortfolioGalleryScreen extends StatefulWidget {
  const PortfolioGalleryScreen({super.key});

  @override
  State<PortfolioGalleryScreen> createState() => _PortfolioGalleryScreenState();
}

class _PortfolioGalleryScreenState extends State<PortfolioGalleryScreen> {
  final auth = FirebaseAuth.instance;
  int currentIndex = 0;
  late String _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NewChoBo',
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // 검색 버튼 클릭 시 동작
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // 검색 버튼 클릭 시 동작
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String result) {
              setState(() {
                _selectedOption = result;
              });

              if (_selectedOption == 'logout') {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacementNamed(context, '/');
              } else if (_selectedOption == 'logout') {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).popUntil((route) => route.isFirst);
              }
            },
            icon: const Icon(Icons.person),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              if (auth.currentUser == null)
                const PopupMenuItem<String>(
                  value: 'login',
                  child: Text('Login'),
                ),
              if (auth.currentUser != null)
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              const PopupMenuItem<String>(
                value: 'option2',
                child: Text('Option 2'),
              ),
              const PopupMenuItem<String>(
                value: 'option3',
                child: Text('Option 3'),
              ),
            ],
          ),
        ],
      ),
      drawer: const DrawerMain(),
      body: PortfolioMain(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_alt_rounded),
            label: 'Filter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Config',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_rounded),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
