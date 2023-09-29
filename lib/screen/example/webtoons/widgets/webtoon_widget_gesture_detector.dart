import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/screen/example/webtoons/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //제스처 등록
      onTap: () {
        //라우터 등록
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            fullscreenDialog: true, //스크린 뜨는 방향
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.5),
                  )
                ],
              ),
              width: 250,
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                thumb,
                headers: const {
                  'User-Agent':
                      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                  'Referer': 'https://comic.naver.com',
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
