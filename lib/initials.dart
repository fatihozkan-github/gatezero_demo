import 'package:gatezero_demo/core/UI/presentation/view_model_base.dart';
import 'package:gatezero_demo/features/features_landing/presentation/view_models/view_model_landing.dart';
import 'package:gatezero_demo/features/features_main/presentation/view_models/view_model_bottom_navigation.dart';
import 'package:gatezero_demo/providers/provider_feed.dart';
import 'package:gatezero_demo/providers/provider_interaction.dart';
import 'package:gatezero_demo/providers/provider_user.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter/material.dart';

import 'core/router/router.gr.dart';
import 'features/features_main/presentation/view_models/leader_board/view_model_leader_board.dart';

class Initials {
  static String appTitle = 'GateZero';

  static final _injector = GetIt.instance;

  static void setupInjector() {
    _injector.registerSingleton<AppRouter>(AppRouter());
  }

  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => BaseViewModel()),
    ChangeNotifierProvider(create: (context) => LandingViewModel()),
    ChangeNotifierProvider(create: (context) => BottomNavigationViewModel()),
    ChangeNotifierProvider(create: (context) => LeaderBoardViewModel()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => FeedProvider()),
    ChangeNotifierProvider(create: (context) => InteractionProvider()),
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    /// Welcome Pages
    // '/screen_landing': (context) => LandingScreen(),
    // '/screen_welcome': (context) => WelcomeScreen(),

    /// Bottom Navigation
    // '/bottom_navigation': (context) => BottomNavigation(),
    // '/screen_feed': (context) => FeedScreen(),
    // '/screen_leader_board': (context) => LeaderBoardScreen(),
    // '/screen_map': (context) => MapScreen(),
    // '/screen_map_feedback': (context) => MapFeedbackScreen(),
    // '/screen_prizes': (context) => PrizesScreen(),
    // '/screen_QR': (context) => QRScreen(),

    /// Profile pages
    // '/screen_profile': (context) => ProfileScreen(),
    // '/screen_settings': (context) => SettingsScreen(),
    // '/screen_search': (context) => SearchScreen(),
    // '/screen_other_profile': (context) => OtherProfileScreen(),
    // '/screen_statistics': (context) => StatisticsScreen(),

    // /// Drawer pages
    // '/screen_badge': (context) => BadgeScreen(),
    // '/screen_duel': (context) => DuelScreen(),
    // '/screen_training': (context) => TrainingSet(),
    // '/screen_invite': (context) => InviteScreen(),
    // '/screen_feedback': (context) => FeedbackScreen(),
    // '/screen_challenge': (context) => ChallengeScreen(),
    // '/screen_challenge_detail': (context) => ChallengeDetailScreen(),
    // '/screen_share_challenge': (context) => ChallengeShareScreen(),
    //
    // /// QR Pages
    // '/screen_read_qr': (context) => ReadQRScreen(),
    //
    // /// Interaction Pages
    // '/screen_interaction': (context) => ObjectGesturesWidget(),
    // '/screen_calculation': (context) => CalculationScreen(),
    //
    // /// Story Pages
    // '/screen_story': (context) => NewStoryScreen(),
    // '/screen_share_story': (context) => ShareStoryScreen(),
  };
}
