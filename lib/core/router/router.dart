import 'package:auto_route/auto_route.dart';
import 'package:gatezero_demo/features/features_drawer/presentation/views/challenge/view_challenge_detail.dart';
import 'package:gatezero_demo/features/features_drawer/presentation/views/challenge/view_challenges.dart';
import 'package:gatezero_demo/features/features_drawer/presentation/views/duels/screen_duels.dart';
import 'package:gatezero_demo/features/features_drawer/presentation/views/view_training_set.dart';
import 'package:gatezero_demo/features/features_main/presentation/views/feed/screen_share_story.dart';
import 'package:gatezero_demo/features/features_main/presentation/views/feed/view_feed.dart';
import 'package:gatezero_demo/features/features_main/presentation/views/qr/view_calculation.dart';
import 'package:gatezero_demo/features/features_profile/presentation/views/view_other_profile.dart';
import 'package:gatezero_demo/features/features_profile/presentation/views/view_statistics.dart';

import '../../features/features_drawer/presentation/views/challenge/view_challenge_share.dart';
import '../../features/features_drawer/presentation/views/view_badge.dart';
import '../../features/features_drawer/presentation/views/view_feedback.dart';
import '../../features/features_drawer/presentation/views/view_invite.dart';
import '../../features/features_landing/presentation/views/view_landing.dart';
import '../../features/features_landing/presentation/views/view_welcome.dart';
import '../../features/features_main/presentation/views/feed/vew_new_story.dart';
import '../../features/features_main/presentation/views/leader_board/view_leader_board.dart';
import '../../features/features_main/presentation/views/map/view_google_map.dart';
import '../../features/features_main/presentation/views/map/view_map_feedback.dart';
import '../../features/features_main/presentation/views/qr/view_custom_ar.dart';
import '../../features/features_main/presentation/views/qr/view_custom_qr.dart';
import '../../features/features_main/presentation/views/qr/view_read_qr.dart';
import '../../features/features_main/presentation/views/view_bottom_navigation.dart';
import '../../features/features_profile/presentation/views/view_profile.dart';
import '../../features/features_profile/presentation/views/view_search.dart';
import '../../features/features_profile/presentation/views/view_settings.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    /// Landing
    AutoRoute(page: LandingView, path: "/", initial: true),
    AutoRoute(page: WelcomeView, path: "/view_welcome"),

    /// Bottom Navigation
    AutoRoute(page: BottomNavigationView, path: "/view_bottom_navigation"),
    AutoRoute(page: FeedView, path: "/view_feed"),
    AutoRoute(page: NewStoryView, path: "/view_new_story"),
    AutoRoute(page: ShareStoryView, path: "/view_share_story"),
    AutoRoute(page: GoogleMapView, path: "/view_google_map"),
    AutoRoute(page: MapFeedbackView, path: "/view_map_feedback"),
    AutoRoute(page: LeaderBoardView, path: "/view_leader_board"),
    AutoRoute(page: CustomQRView, path: "/view_custom_qr"),
    AutoRoute(page: ReadQRView, path: "/view_read_qr"),
    AutoRoute(page: CustomARView, path: "/view_custom_ar"),
    AutoRoute(page: CalculationView, path: "/view_calculation"),
    AutoRoute(page: StatisticsView, path: "/view_statistics"),

    /// Drawer
    AutoRoute(page: BadgesView, path: "/view_badges"),
    AutoRoute(page: DuelView, path: "/view_duel"),
    AutoRoute(page: ChallengeView, path: "/view_challenges"),
    AutoRoute(page: ChallengeDetailView, path: "/view_detail_challenges"),
    AutoRoute(page: ChallengeShareView, path: "/view_share_challenge"),
    AutoRoute(page: TrainingSetView, path: "/view_training_set"),
    AutoRoute(page: InviteView, path: "/view_invite"),
    AutoRoute(page: FeedbackView, path: "/view_feedback"),

    /// Profile
    AutoRoute(page: ProfileView, path: "/view_profile"),
    AutoRoute(page: SettingsView, path: "/view_settings"),
    AutoRoute(page: SearchView, path: "/view_search"),
    AutoRoute(page: OtherProfileView, path: "/view_other_profile"),
  ],
)
class $AppRouter {}

/// flutter packages pub run build_runner build
