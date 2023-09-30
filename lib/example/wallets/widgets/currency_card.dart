import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  // Color bgColor;
  // Color textColor;
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final int order;

  final blackColor = const Color(0xFF1F2123);

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, (order - 1) * -20),
      child: Container(
        clipBehavior: Clip.hardEdge, //OverFlow 어떻게 다룰지......
        decoration: BoxDecoration(
          color: isInverted ? blackColor : Colors.indigo,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2.0, //아이콘 트랜스폼 크기, ...
                child: Transform.translate(
                  offset: const Offset(-5, 10), //움직임 위치
                  child: Icon(
                    icon,
                    size: 88,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
