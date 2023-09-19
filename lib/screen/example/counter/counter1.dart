import 'package:flutter/material.dart';

class Counter1Widget extends StatefulWidget {
  const Counter1Widget({Key? key}) : super(key: key);

  @override
  State<Counter1Widget> createState() => _Counter1WidgetState();
}

class _Counter1WidgetState extends State<Counter1Widget> {
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
            const Text(
              'Click Count',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              '$counter',
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
