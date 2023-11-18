import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/model/portfolio_model.dart';

class ApiService {
  static const String baseUrl = "http://whwjdrb1009.asuscomm.com:20001";

  //포트폴리오 목록을 가져온다.
  static Future<List<PortfolioModel>> getPortfolioList() async {
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
      final List<dynamic> portfolioList = apiResult['responseData']['list'];

      for (var portfolio in portfolioList) {
        final instance = PortfolioModel.fromJson(portfolio);
        portfolioInstances.add(instance);
      }
      return portfolioInstances;
    }
    throw Error();
  }

  static Future<PortfolioModel> getPortfolio(int portfolioId) async {
    final url = Uri.parse('$baseUrl/portfolio/$portfolioId');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final apiResult = jsonDecode(response.body);
      final dynamic portfolio = apiResult['responseData']['data'];

      return PortfolioModel.fromJson(portfolio);
    }
    throw Error();
  }
}
