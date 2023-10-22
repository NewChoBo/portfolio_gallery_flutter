import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/example/counter/counter2.dart';
import 'package:portfolio_gallery_flutter/example/pomodoro/pomodoro.dart';
import 'package:portfolio_gallery_flutter/example/theme/theme_and_life_cycle_ex.dart';
import 'package:portfolio_gallery_flutter/example/wallets/wallets.dart';
import 'package:portfolio_gallery_flutter/example/webtoons/screens/webtoons_home_future_buillder.dart';

class SelectExamples extends StatelessWidget {
  const SelectExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Examples'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '보고싶은 예제를 선택하세요.',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
            ),
            const ExampleButton(title: 'Counter', toGo: Counter2Widget()),
            const ExampleButton(title: 'Pomodoro', toGo: PomodoroWidget()),
            const ExampleButton(title: 'Theme Example', toGo: ThemeExample()),
            const ExampleButton(title: 'Wallets', toGo: WalletsWidget()),
            ExampleButton(title: 'Webtoons', toGo: WebtoonsHome()),
          ],
        ),
      ),
    );
  }
}

class ExampleButton extends StatelessWidget {
  final String title;
  final Widget toGo;

  const ExampleButton({
    super.key,
    required this.title,
    required this.toGo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => toGo,
              fullscreenDialog: true, //스크린 뜨는 방향
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.lightBlueAccent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
