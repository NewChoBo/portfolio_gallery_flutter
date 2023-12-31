import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_gallery_flutter/screen/portal/portal.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/model/portfolio_model.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/screen/auth/login_screen.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/screen/auth/signup_screen.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/screen/not_found_screen.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/screen/portfolio_gallery_screen.dart';
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
          path: '/portfolio_gallery',
          builder: (BuildContext context, GoRouterState state) =>
              const PortfolioGalleryScreen(),
          routes: [
            GoRoute(
              path: 'detail/:portfolioId',
              builder: (context, state) {
                final portfolioId =
                    int.parse(state.pathParameters['portfolioId']!);
                final portfolioModel = state.extra as PortfolioModel?;

                return PortfolioDetail(
                  portfolioId: portfolioId,
                  portfolioModel: portfolioModel,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/auth',
          builder: (BuildContext context, GoRouterState state) =>
              const PortfolioGalleryScreen(),
          routes: [
            GoRoute(
              path: 'login',
              builder: (context, state) {
                return const LoginScreen();
              },
            ),
            GoRoute(
              path: 'signup',
              builder: (context, state) {
                return const SignupScreen();
              },
            ),
          ],
        ),

        //연습 화면
        GoRoute(
          path: '/practice',
          builder: (context, state) {
            return const PortalScreen();
          },
        )
      ],
    );
  }
}
