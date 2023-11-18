import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/model/portfolio_model.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/service/api_service.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/widget/cards/portfolio_widget.dart';

class PortfolioDetail extends StatelessWidget {
  final int portfolioId;
  final PortfolioModel? portfolioModel;

  const PortfolioDetail({
    super.key,
    required this.portfolioId,
    this.portfolioModel,
  });

  @override
  Widget build(BuildContext context) {
    if (portfolioModel != null) {
      return _buildPortfolioDetail(portfolioModel!);
    } else {
      return FutureBuilder<PortfolioModel>(
        future: ApiService.getPortfolio(portfolioId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('오류가 발생했습니다: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return _buildPortfolioDetail(snapshot.data!);
          } else {
            return const Text('데이터를 불러오는데 실패했습니다.');
          }
        },
      );
    }
  }

  Widget _buildPortfolioDetail(PortfolioModel portfolio) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: 'portfolio-${portfolio.portfolioId}',
            child: Portfolio(
              userId: portfolio.userId,
              portfolioId: portfolio.portfolioId,
              thumb: portfolio.thumb,
            ),
          ),
          Text(
            '값 : ${portfolio.portfolioId}',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
