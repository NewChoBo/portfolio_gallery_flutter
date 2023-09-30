import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/example/webtoons/models/webtoon_model.dart';
import 'package:portfolio_gallery_flutter/example/webtoons/servies/api_service.dart';

class WebtoonsHome extends StatefulWidget {
  const WebtoonsHome({super.key});

  @override
  State<WebtoonsHome> createState() => _WebtoonsHomeState();
}

class _WebtoonsHomeState extends State<WebtoonsHome> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebToons() async {
    webtoons = await ApiService().getTodaysToons();
    isLoading = false;
    setState(
      () {},
    );
  }

  @override
  void initState() {
    super.initState();
    waitForWebToons();
  }

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
    );
  }
}
