import 'package:flutter/material.dart';

class ThemeExample extends StatefulWidget {
  const ThemeExample({Key? key}) : super(key: key);

  @override
  State<ThemeExample> createState() => _ThemeExampleState();
}

class _ThemeExampleState extends State<ThemeExample> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showTitle ? const MyLargeTitle() : const Text('nothing to see'),
            IconButton(
              onPressed: toggleTitle,
              icon: const Icon(
                Icons.invert_colors,
                color: Colors.green,
              ),
              // color: Colors.yellow, //이건 어떻게 영향 미치는거지?
            )
          ],
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    super.initState();
    print('initState : 위젯이 생성될 때');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose : 위젯이 스크린에서 사라질 때 동작');
  }

  //context는 위젯트리의 정보를 갖고있다?
  @override
  Widget build(BuildContext context) {
    print('build : 위젯이 빌드될 때 동작');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        // color: Theme.of(context).textTheme.titleLarge!.color,
        //titleLarge.color 이 있다고 보장
        color: Theme.of(context).textTheme.titleLarge?.color,
        //titleLarge.color 이 있으면 사용
      ),
    );
  }
}
