import 'package:auto_route/auto_route.dart';

import '../../features/features_landing/presentation/views/view_landing.dart';
import '../../features/features_landing/presentation/views/view_welcome.dart';
import '../../features/features_main/presentation/views/map/view_google_map.dart';
import '../../features/features_main/presentation/views/map/view_map_feedback.dart';
import '../../features/features_main/presentation/views/view_bottom_navigation.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: LandingView, path: "/", initial: true),
    AutoRoute(page: WelcomeView, path: "/view_welcome"),
    AutoRoute(page: BottomNavigationView, path: "/view_bottom_navigation"),
    AutoRoute(page: GoogleMapView, path: "/view_google_map"),
    AutoRoute(page: MapFeedbackView, path: "/view_map_feedback"),
  ],
)
class $AppRouter {}
