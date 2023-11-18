import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/model/portfolio_model.dart';

class ApiService {
  static const String baseUrl = "http://whwjdrb1009.asuscomm.com:20001";

  //포트폴리오 목록을 가져온다.
  static Future<List<PortfolioModel>> getPortfolios() async {
    List<PortfolioModel> portfolioInstances = [];
    var page = 0;
    var size = 3;
    final url = Uri.parse('$baseUrl/portfolio/list').replace(queryParameters: {
      'page': page.toString(),
      'size': size.toString(),
    });

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final apiResult = jsonDecode(response.body);
      final List<dynamic> portfolios = apiResult['responseData']['list'];

      for (var portfolio in portfolios) {
        final instance = PortfolioModel.fromJson(portfolio);
        portfolioInstances.add(instance);
      }
      return portfolioInstances;
    }
    throw Error();
  }
}
