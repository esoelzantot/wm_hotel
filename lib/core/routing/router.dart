import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wm_hotel/core/helpers/app_transitions.dart';
import 'package:wm_hotel/core/routing/end_points.dart';
import 'package:wm_hotel/features/home/presentation/views/home_view.dart';
import 'package:wm_hotel/features/venues/presentation/views/venues_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: EndPoints.homeView,
    routes: [
      // ============================================================
      // Splash Screen - Quick Fade
      // ============================================================
      // GoRoute(
      //   path: EndPoints.splashView,
      //   name: 'splash',
      //   pageBuilder: (context, state) =>
      //       AppTransitions.quickFade(state.pageKey, const SplashView()),
      // ),

      // ============================================================
      // Home Screen - Smooth Fade
      // ============================================================
      GoRoute(
        path: EndPoints.homeView,
        name: 'Home View',
        pageBuilder: (context, state) =>
            AppTransitions.smoothFade(state.pageKey, const HomeView()),
      ),

      // ============================================================
      // Venues Screen - Smooth Fade
      // ============================================================
      GoRoute(
        path: EndPoints.venuesView,
        name: 'Venues View',
        pageBuilder: (context, state) =>
            AppTransitions.smoothFade(state.pageKey, const VenuesView()),
      ),

      // ============================================================
      // Article Details View - Fade with Scale
      // ============================================================
      // GoRoute(
      //   path: EndPoints.articleDetailsView,
      //   name: 'ArticleDetails',
      //   pageBuilder: (context, state) => AppTransitions.fadeForDetails(
      //     state.pageKey,
      //     ArticleDetailsView(
      //       article: state.extra,
      //     ),
      //   ),
      // ),

      // ============================================================
      // Asky Screen - Smooth Fade
      // ============================================================
      // GoRoute(
      //   path: EndPoints.askyView,
      //   name: 'Asky View',
      //   pageBuilder: (context, state) => AppTransitions.smoothFade(
      //     state.pageKey,
      //     const AskyView(),
      //   ),
      // ),
    ],

    // Custom error page with smooth fade
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found: ${state.uri.toString()}',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  context.go('/'), // Navigate back to home or a default page
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
