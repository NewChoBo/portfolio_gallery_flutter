import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:portfolio_gallery_flutter/example/webtoons/models/webtoon_detail_model.dart';
import 'package:portfolio_gallery_flutter/example/webtoons/models/webtoon_episode_model.dart';
import 'package:portfolio_gallery_flutter/example/webtoons/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';

  final String today = "today";

  //오늘의 웹툰 목록 받는 Api
  Future<List<WebtoonModel>> getTodaysToons() async {
    //pub.dev에서 원하는 패키지 설치 가능
    //dart pub add http
    //그냥 get(url)로 사용도 가능하나, 직관적이지 못하여 import에서 http로 name 지정

    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    List<WebtoonModel> webtoonInstances = [];

    if (response.statusCode == 200) {
      // print(response);
      // print('----------');
      // print(response.body);
      final List<dynamic> webtoons = jsonDecode(response.body); //모델에 맞춰 담아줌
      for (var webtoon in webtoons) {
        /**방식 1 */
        // print(webtoon);
        // final toon = WebtoonModel.fromJson(webtoon);
        // print(toon.title);
        // webtoonInstances.add(toon);

        /**방식 2 */
        // print(webtoonInstances);
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    } else {
      throw Error();
    }
  }

  //웹툰 상세 정보 받는 api
  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  //웹툰 에피소드 목록 가져오는 api
  static Future<List<WebtoonEpisodeModel>> getLastestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
