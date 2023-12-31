import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  final String userId, thumb;
  final int portfolioId;

  const Portfolio({
    super.key,
    required this.userId,
    required this.portfolioId,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 5,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  width: double.infinity,
                  height: 0.6 * MediaQuery.of(context).size.height,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        0.04 * MediaQuery.of(context).size.width),
                  ),
                  child: Image.network(
                    thumb,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              userId,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
