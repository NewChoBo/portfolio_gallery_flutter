import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 Not Found'),
      ),
      body: const Center(
        child: Text(
          '페이지를 찾을 수 없습니다.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
