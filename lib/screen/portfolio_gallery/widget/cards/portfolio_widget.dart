import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return GestureDetector(
      onTap: () {
        context.go('/portfolio_gallery/detail/$portfolioId',
            extra: portfolioId);
      },
      child: AspectRatio(
        aspectRatio: 3 / 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                offset: const Offset(6, 4),
                color: Colors.black.withOpacity(0.5),
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
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
            ],
          ),
        ),
      ),
    );
  }
}
