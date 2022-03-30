import 'package:auto_route/auto_route.dart';
import 'package:gatezero_demo/features/features_drawer/presentation/views/view_badge.dart';
import 'package:gatezero_demo/features/features_drawer/presentation/views/view_feedback.dart';
import 'package:gatezero_demo/features/features_drawer/presentation/views/view_invite.dart';
import 'package:gatezero_demo/features/features_main/presentation/views/leader_board/view_leader_board.dart';
import 'package:gatezero_demo/features/features_main/presentation/views/qr/view_custom_ar.dart';
import 'package:gatezero_demo/features/features_main/presentation/views/qr/view_custom_qr.dart';
import 'package:gatezero_demo/features/features_main/presentation/views/qr/view_read_qr.dart';
import 'package:gatezero_demo/features/features_profile/presentation/views/view_profile.dart';
import 'package:gatezero_demo/features/features_profile/presentation/views/view_settings.dart';

import '../../features/features_landing/presentation/views/view_landing.dart';
import '../../features/features_landing/presentation/views/view_welcome.dart';
import '../../features/features_main/presentation/views/map/view_google_map.dart';
import '../../features/features_main/presentation/views/map/view_map_feedback.dart';
import '../../features/features_main/presentation/views/view_bottom_navigation.dart';
import '../../features/features_profile/presentation/views/view_search.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    /// Landing
    AutoRoute(page: LandingView, path: "/"),
    AutoRoute(page: WelcomeView, path: "/view_welcome", initial: true),

    /// Bottom Navigation
    AutoRoute(page: BottomNavigationView, path: "/view_bottom_navigation"),
    AutoRoute(page: GoogleMapView, path: "/view_google_map"),
    AutoRoute(page: MapFeedbackView, path: "/view_map_feedback"),
    AutoRoute(page: LeaderBoardView, path: "/view_leader_board"),
    AutoRoute(page: CustomQRView, path: "/view_custom_qr"),
    AutoRoute(page: ReadQRView, path: "/view_read_qr"),
    AutoRoute(page: CustomARView, path: "/view_custom_ar"),

    /// Drawer
    AutoRoute(page: BadgesView, path: "/view_badges"),
    AutoRoute(page: InviteView, path: "/view_invite"),
    AutoRoute(page: FeedbackView, path: "/view_feedback"),

    /// Profile
    AutoRoute(page: ProfileView, path: "/view_profile"),
    AutoRoute(page: SettingsView, path: "/view_settings"),
    AutoRoute(page: SearchView, path: "/view_search"),
  ],
)
class $AppRouter {}
