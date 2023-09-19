import 'package:flutter/material.dart';

class Counter2Widget extends StatefulWidget {
  const Counter2Widget({Key? key}) : super(key: key);

  @override
  State<Counter2Widget> createState() => _Counter2WidgetState();
}

class _Counter2WidgetState extends State<Counter2Widget> {
  List<int> numbers = [];

  void counterAdd() {
    setState(() {
      numbers.add(numbers.length);
      print(numbers);
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
            const Text(
              'Click Count',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            for (var n in numbers) //for문으로 위젯 출력 가능
              Text(
                '$n',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: counterAdd,
              icon: const Icon(
                Icons.add_box,
                color: Colors.blue,
                size: 40,
              ),
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }
}
