import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/screen/main/home_main.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/widget/drawer_widget.dart';

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
      drawer: const DrawerMain(),
      body: HomeMain(),
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
