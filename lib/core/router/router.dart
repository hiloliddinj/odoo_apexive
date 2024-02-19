import 'package:go_router/go_router.dart';

import '../../domain/entities/timer/timer_entity.dart';
import '../../presentation/pages/create_timer_screen.dart';
import '../../presentation/pages/home_screen.dart';
import '../../presentation/pages/splash_screen.dart';
import '../../presentation/pages/timer_detail_screen.dart';
import 'app_routes.dart';

/// Router
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      name: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'create_timer',
          name: AppRoutes.createTimer,
          builder: (context, state) => const CreateTimerScreen(),
        ),
        GoRoute(
          path: 'timer_detail',
          name: AppRoutes.timerDetail,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            final timer = extra?['timer'] as TimerEntity?;

            return TimerDetailScreen(timer: timer);
          },
        ),
      ],
    ),
  ],
);
