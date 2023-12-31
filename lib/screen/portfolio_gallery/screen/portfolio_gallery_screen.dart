import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/notifier/firebase_auth_notifier.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/screen/main/portfolio_main.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/widget/add-on/home/bottom_navigation_widget.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/widget/add-on/home/drawer_widget.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/widget/add-on/home/toolbar_widget.dart';
import 'package:provider/provider.dart';

class PortfolioGalleryScreen extends StatefulWidget {
  const PortfolioGalleryScreen({super.key});

  @override
  State<PortfolioGalleryScreen> createState() => _PortfolioGalleryScreenState();
}

class _PortfolioGalleryScreenState extends State<PortfolioGalleryScreen> {
  @override
  Widget build(BuildContext context) {
    final firebaseAuthNotifier = Provider.of<FirebaseAuthNotifier>(context);
    final User? currentUser = firebaseAuthNotifier.currentUser;

    return Scaffold(
      appBar: HomeAppBar(
        auth: FirebaseAuth.instance,
        onSelected: (String result) {},
      ),
      drawer: const DrawerMain(),
      body: PortfolioMain(),
      bottomNavigationBar: HomeBottomNavigationBar(
        currentIndex: 0,
      ),
    );
  }
}
