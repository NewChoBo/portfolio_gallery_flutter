class PortfolioModel {
  final String userId, thumb;
  final int portfolioId;

  PortfolioModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        portfolioId = json['portfolioId'],
        thumb = json['thumb'];
}
