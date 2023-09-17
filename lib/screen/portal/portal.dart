import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/config/theme/themeNotifier.dart';
import 'package:provider/provider.dart';

class PortalWidget extends StatelessWidget {
  const PortalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    // theme = Theme.of(context);
    // https://velog.io/@tygerhwang/FLUTTER-Project-Theme-and-Size-Settings

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        // padding: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            // SizedBox(
            //   height: 80,
            // ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
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
          ],
        ),
      ),
    );
  }
}
