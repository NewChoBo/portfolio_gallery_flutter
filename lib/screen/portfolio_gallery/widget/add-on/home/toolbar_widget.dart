import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_gallery_flutter/config/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final FirebaseAuth auth;
  final Function(String) onSelected;

  const HomeAppBar({
    Key? key,
    required this.auth,
    required this.onSelected,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return AppBar(
      title: const Text('NewChoBo'),
      backgroundColor: Colors.black,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // 검색 버튼 클릭 시 동작
          },
        ),
        IconButton(
          icon: Icon(themeNotifier.themeMode == ThemeMode.dark
              ? Icons.brightness_7
              : Icons.brightness_4),
          onPressed: () {
            // 라이트모드 / 다크모드 전환
            Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // 알림 버튼 클릭 시 동작
          },
        ),
        PopupMenuButton<String>(
          onSelected: onSelected,
          icon: const Icon(Icons.person),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            if (auth.currentUser == null)
              PopupMenuItem<String>(
                value: 'login',
                child: const Text('Login'),
                onTap: () => context.go('/auth/login'),
              ),
            if (auth.currentUser != null)
              PopupMenuItem<String>(
                value: 'logout',
                child: const Text('Logout'),
                onTap: () => auth.signOut(),
              ),
            const PopupMenuItem<String>(
              value: 'option2',
              child: Text('Option 2'),
            ),
            PopupMenuItem<String>(
              value: 'option3',
              child: const Text('연습한 화면 조회'),
              onTap: () => context.go('/practice'),
            ),
          ],
        ),
      ],
    );
  }
}
