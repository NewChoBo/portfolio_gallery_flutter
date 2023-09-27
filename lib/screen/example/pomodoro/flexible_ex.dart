import 'package:flutter/material.dart';

class PomodoroWidget extends StatefulWidget {
  const PomodoroWidget({Key? key}) : super(key: key);

  @override
  State<PomodoroWidget> createState() => _PomodoroWidgetState();
}

class _PomodoroWidgetState extends State<PomodoroWidget> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Flexible은 비율에 따른 UI를 만드는걸 도와줌
            //flex는 1이 기본값
            Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
