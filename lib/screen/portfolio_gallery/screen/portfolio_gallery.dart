import 'package:flutter/material.dart';

class PortfolioGalleryScreen extends StatefulWidget {
  const PortfolioGalleryScreen({super.key});

  @override
  State<PortfolioGalleryScreen> createState() => _PortfolioGalleryScreenState();
}

class _PortfolioGalleryScreenState extends State<PortfolioGalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hello'),
      ),
      drawer: const Drawer(child: Text('And Again')),
      body: const Center(),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.abc_rounded),
          label: 'bye',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.abc_rounded),
          label: 'hello',
        ),
      ]),
    );
  }
}
