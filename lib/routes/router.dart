import 'package:furevr/routes/nav.dart';
import 'package:furevr/test.dart';
import 'package:furevr/view/auth/phone_auth_view.dart';
import 'package:furevr/view/collection/service_view.dart';
import 'package:furevr/view/dashboard/dashboard_view.dart';
import 'package:furevr/view/grooming/grooming_view.dart';
import 'package:furevr/view/home/home_view.dart';
import 'package:furevr/view/profile/profile_view.dart';
import 'package:furevr/view/splash_view/splash_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const SplashView(),
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Navigation.testView,
      name: getNavigatorName(Navigation.testView),
      builder: (context, state) => const TextTT(),
    ),
    GoRoute(
      path: Navigation.dashboardView,
      name: getNavigatorName(Navigation.dashboardView),
      builder: (context, state) => const DashboardView(),
    ),
    GoRoute(
      path: Navigation.collectionView,
      name: getNavigatorName(Navigation.collectionView),
      builder: (context, state) => const CollectionView(),
    ),
    GoRoute(
      path: Navigation.homeView,
      name: getNavigatorName(Navigation.homeView),
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: Navigation.groomingView,
      name: getNavigatorName(Navigation.groomingView),
      builder: (context, state) => const GroomingView(),
    ),
    GoRoute(
      path: Navigation.profileView,
      name: getNavigatorName(Navigation.profileView),
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: Navigation.mobileAuthView,
      name: getNavigatorName(Navigation.mobileAuthView),
      builder: (context, state) => const PhoneAuthView(),
    ),
  ],
);
