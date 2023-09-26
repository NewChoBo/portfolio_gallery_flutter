import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/screen/example/webtoons/models/webtoon_model.dart';
import 'package:portfolio_gallery_flutter/screen/example/webtoons/servies/api_service.dart';

class WebtoonsHome extends StatelessWidget {
  WebtoonsHome({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 1, //앱바 그림자
        centerTitle: true,
        title: const Text(
          "오늘의 웹툰(today's toons)",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            //snapshot으로 Future의 상태를 볼 수 있다
            if (snapshot.hasData) {
              return ListView.separated(
                  //separatorBuilder은 각 항목 사이사이에 위젯 리턴
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var webtoon = snapshot.data![index];
                    return Text(
                      webtoon.title,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 50),
                  itemCount: snapshot.data!.length);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }), //builder 은 위젯을 그려주는 함수
    );
  }
}

//ListView 기초
class ListView00 extends StatelessWidget {
  final List<WebtoonModel> data;

  const ListView00({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var webtoon in data)
          Text(
            webtoon.title,
            style: const TextStyle(
              color: Colors.blue,
            ),
          )
      ],
    );
  }
}

//ListView.builder 활용
class ListView01 extends StatelessWidget {
  final List<WebtoonModel> data;
  const ListView01({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        var webtoon = data[index];
        print(index);
        return Text(
          webtoon.title,
          style: const TextStyle(
            color: Colors.red,
          ),
        );
      },
    );
  }
}
