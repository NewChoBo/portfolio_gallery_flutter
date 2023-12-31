import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/model/portfolio_model.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/widget/cards/businesscard_widget.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/widget/cards/portfolio_widget.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/service/api_service.dart';

class PortfolioMain extends StatelessWidget {
  PortfolioMain({super.key});

  final Future<List<PortfolioModel>> portfolios = ApiService.getPortfolioList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Expanded(
          child: BusinessCardWidget(
            name: 'John Doe',
            jobTitle: 'Software Developer',
            company: 'ABC Inc.',
            email: 'john.doe@abcinc.com',
            phone: '+1 (123) 456-7890',
            profileImage: 'https://source.unsplash.com/random',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 16.0),
          child: const Text(
            'Portfolios',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: FutureBuilder(
            future: portfolios,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Expanded(
                      child: makeList(snapshot),
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  ListView makeList(AsyncSnapshot<List<PortfolioModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var portfolio = snapshot.data![index];

        return GestureDetector(
          onTap: () {
            context.go(
              '/portfolio_gallery/detail/${portfolio.portfolioId}',
              extra: portfolio,
            );
          },
          child: Hero(
            tag: 'portfolio-${portfolio.portfolioId}',
            child: Portfolio(
              userId: portfolio.userId,
              portfolioId: portfolio.portfolioId,
              thumb: portfolio.thumb,
            ),
          ),
        );
      },
    );
  }
}
