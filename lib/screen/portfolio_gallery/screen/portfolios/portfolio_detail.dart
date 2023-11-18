import 'package:flutter/material.dart';

class PortfolioDetail extends StatelessWidget {
  final int portfolioId;

  const PortfolioDetail({
    super.key,
    required this.portfolioId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        '값 : $portfolioId',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
