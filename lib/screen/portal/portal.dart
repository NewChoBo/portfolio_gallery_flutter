import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/example/webtoons/screens/webtoons_home_future_buillder.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/portfolio_gallery.dart';

class PortalScreen extends StatefulWidget {
  const PortalScreen({Key? key}) : super(key: key);

  @override
  State<PortalScreen> createState() => _PortalScreenState();
}

class _PortalScreenState extends State<PortalScreen> {
  int counter = 0;

  void counterAdd() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebtoonsHome(),
                    fullscreenDialog: true, //스크린 뜨는 방향
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    children: [
                      Text(
                        'Examples',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PortfolioGalleryScreen(),
                    fullscreenDialog: true, //스크린 뜨는 방향
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    children: [
                      Text(
                        'portfolio gallery',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
