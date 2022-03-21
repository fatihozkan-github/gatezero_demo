import 'package:gatezero_demo/providers/provider_feed.dart';
import 'package:gatezero_demo/providers/provider_interaction.dart';
import 'package:gatezero_demo/providers/provider_user.dart';
import 'package:gatezero_demo/screens/bottom_navigation/bottom_navigation.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_feed/screen_feed.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_feed/screen_share_story.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_feed/screen_story.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_leader_board/screen_leaderboard.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_map/screen_map.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_map/screen_map_feedback.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_prizes/screen_prizes.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_qr/screen_qr.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_qr/screen_read_qr.dart';
import 'package:gatezero_demo/screens/drawer/challenge/screen_challenge_detail.dart';
import 'package:gatezero_demo/screens/drawer/challenge/screen_challenge_share.dart';
import 'package:gatezero_demo/screens/drawer/challenge/screen_challenges.dart';
import 'package:gatezero_demo/screens/drawer/duels/screen_duels.dart';
import 'package:gatezero_demo/screens/drawer/screen_badges.dart';
import 'package:gatezero_demo/screens/drawer/screen_feedback.dart';
import 'package:gatezero_demo/screens/drawer/screen_invite.dart';
import 'package:gatezero_demo/screens/drawer/screen_search.dart';
import 'package:gatezero_demo/screens/drawer/training_set/page/training_set.dart';
import 'package:gatezero_demo/screens/interaction/screen_calculation.dart';
import 'package:gatezero_demo/screens/interaction/screen_interaction.dart';
import 'package:gatezero_demo/screens/intro/screen_landing.dart';
import 'package:gatezero_demo/screens/intro/screen_welcome.dart';
import 'package:gatezero_demo/screens/profile_screens/screen_other_profile.dart';
import 'package:gatezero_demo/screens/profile_screens/screen_profile.dart';
import 'package:gatezero_demo/screens/profile_screens/screen_settings.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter/material.dart';

class Initials {
  static String appTitle = 'GateZero';

  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => FeedProvider()),
    ChangeNotifierProvider(create: (context) => InteractionProvider()),
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    /// Welcome Pages
    '/screen_landing': (context) => LandingScreen(),
    '/screen_welcome': (context) => WelcomeScreen(),

    /// Bottom Navigation
    '/bottom_navigation': (context) => BottomNavigation(),
    '/screen_feed': (context) => FeedScreen(),
    '/screen_leader_board': (context) => LeaderBoardScreen(),
    '/screen_map': (context) => MapScreen(),
    '/screen_map_feedback': (context) => MapFeedbackScreen(),
    '/screen_prizes': (context) => PrizesScreen(),
    '/screen_QR': (context) => QRScreen(),

    /// Profile pages
    '/screen_profile': (context) => ProfileScreen(),
    '/screen_settings': (context) => SettingsScreen(),
    '/screen_search': (context) => SearchScreen(),
    '/screen_other_profile': (context) => OtherProfileScreen(),

    /// Drawer pages
    '/screen_badge': (context) => BadgeScreen(),
    '/screen_duel': (context) => DuelScreen(),
    '/screen_training': (context) => TrainingSet(),
    '/screen_invite': (context) => InviteScreen(),
    '/screen_feedback': (context) => FeedbackScreen(),
    '/screen_challenge': (context) => ChallengeScreen(),
    '/screen_challenge_detail': (context) => ChallengeDetailScreen(),
    '/screen_share_challenge': (context) => ChallengeShareScreen(),

    /// QR Pages
    '/screen_read_qr': (context) => ReadQRScreen(),

    /// Interaction Pages
    '/screen_interaction': (context) => InteractionScreen(),
    '/screen_calculation': (context) => CalculationScreen(),

    /// Story Pages
    '/screen_story': (context) => NewStoryScreen(),
    '/screen_share_story': (context) => ShareStoryScreen(),
  };
}
