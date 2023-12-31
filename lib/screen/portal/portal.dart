import 'package:flutter/material.dart';

class PortalWidget extends StatefulWidget {
  const PortalWidget({Key? key}) : super(key: key);

  @override
  State<PortalWidget> createState() => _PortalWidgetState();
}

class _PortalWidgetState extends State<PortalWidget> {
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
              onPressed: counterAdd,
              icon: const Icon(
                Icons.add_box,
                color: Colors.blue,
                size: 60,
              ),
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }
}
