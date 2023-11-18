import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/example/select_example_screen.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/screen/portfolio_gallery_screen.dart';

class PortalScreen extends StatelessWidget {
  const PortalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '메뉴를 선택하세요.',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectExamples(),
                      fullscreenDialog: true, //스크린 뜨는 방향
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.lightBlueAccent,
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
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
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
                    color: Colors.blueAccent,
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
            ),
          ],
        ),
      ),
    );
  }
}
