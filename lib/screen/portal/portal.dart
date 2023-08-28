import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/config/theme/themeNotifier.dart';
import 'package:provider/provider.dart';

class PortalWidget extends StatelessWidget {
  const PortalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          // ThemeNotifier에 접근하여 테마 전환 메서드 호출
          context.read<ThemeNotifier>().toggleTheme();
        },
        child: Text("Toggle Theme"),
      ),
    );
  }
}
