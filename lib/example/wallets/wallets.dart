import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/example/wallets/widgets/button.dart';
import 'package:portfolio_gallery_flutter/example/wallets/widgets/currency_card.dart';

class WalletsWidget extends StatelessWidget {
  const WalletsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    // theme = Theme.of(context);
    // https://velog.io/@tygerhwang/FLUTTER-Project-Theme-and-Size-Settings

    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        // padding: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.bug_report_rounded,
                  color: Colors.white,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Hey, Selena',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Total Balance',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '\$5 194 482',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 44,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //버튼들
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  text: 'Transfer',
                  bgColor: Colors.amber,
                  textColor: Colors.black,
                ),
                Button(
                  text: 'request',
                  bgColor: Colors.indigo,
                  textColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Wallets',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            const CurrencyCard(
              name: 'Euro',
              icon: Icons.euro_symbol_rounded,
              code: 'EUR',
              amount: '6 428',
              isInverted: false,
              order: 1,
            ),
            const CurrencyCard(
              name: 'BitCoin',
              icon: Icons.currency_bitcoin_rounded,
              code: 'BTC',
              amount: '9 785',
              isInverted: true,
              order: 2,
            ),
            const CurrencyCard(
              name: 'Dollar',
              icon: Icons.attach_money,
              code: 'USD',
              amount: '6 428',
              isInverted: false,
              order: 3,
            ),
          ],
        ),
      ),
    );
  }
}
