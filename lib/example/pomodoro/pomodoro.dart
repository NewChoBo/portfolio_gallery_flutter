import 'dart:async';

import 'package:flutter/material.dart';

class PomodoroWidget extends StatefulWidget {
  const PomodoroWidget({Key? key}) : super(key: key);

  @override
  State<PomodoroWidget> createState() => _PomodoroWidgetState();
}

class _PomodoroWidgetState extends State<PomodoroWidget> {
  static const setToRunSec = 1500;

  int totalSeconds = setToRunSec;
  bool isRunning = false;
  int totalPomodoros = 0;

  late Timer timer; //late로 나중에 초기화하도록 할 수 있음

  void onTick() {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros++;
        isRunning = false;
        totalSeconds = setToRunSec;
        timer.cancel();
      });
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        onTick();
      },
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      totalSeconds = setToRunSec;
      isRunning = false;
      totalPomodoros = 0;
    });
  }

  String format(int seconds) {
    // 문자열 자르기
    var duration = Duration(seconds: seconds);
    // print(duration.toString().split(".").first.substring(2, 7));
    return duration.toString().split(".").first.substring(2, 7);
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
                alignment: Alignment.center,
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      color: Theme.of(context).iconTheme.color,
                      iconSize: 98,
                      onPressed:
                          isRunning == true ? onPausePressed : onStartPressed,
                      icon: isRunning == true
                          ? const Icon(Icons.pause)
                          : const Icon(Icons.play_arrow_outlined),
                    ),
                    IconButton(
                      onPressed: onResetPressed,
                      icon: const Icon(
                        Icons.stop,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              // child: Expanded(   //Flexible과 Expanded 함께 사용하지 않음.
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 60,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
