import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/screen/not_found_screen.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/screen/portfolio_gallery.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/screen/portfolios/portfolio_detail.dart';

class AppRouter {
  static GoRouter createRouter() {
    return GoRouter(
      errorBuilder: (context, state) => const NotFoundScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const PortfolioGalleryScreen(),
        ),
        GoRoute(
          path: '/index',
          builder: (BuildContext context, GoRouterState state) =>
              const PortfolioGalleryScreen(),
        ),
        GoRoute(
            path: '/portfolio_gallery',
            builder: (BuildContext context, GoRouterState state) =>
                const PortfolioGalleryScreen(),
            routes: [
              GoRoute(
                path: 'detail/:portfolioId',
                builder: (context, state) {
                  final portfolioId =
                      int.parse(state.pathParameters['portfolioId']!);
                  return PortfolioDetail(portfolioId: portfolioId);
                },
                pageBuilder: (context, state) {
                  final portfolioId =
                      int.parse(state.pathParameters['portfolioId']!);
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: PortfolioDetail(portfolioId: portfolioId),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    transitionDuration:
                        const Duration(milliseconds: 10), // 전환 지속 시간
                  );
                },
              ),
              GoRoute(
                path: 'list',
                builder: (context, state) =>
                    const PortfolioDetail(portfolioId: 5),
              ),
            ]),
      ],
    );
  }
}
