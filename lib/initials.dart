import 'package:gatezero_demo/providers/provider_feed.dart';
import 'package:gatezero_demo/providers/provider_user.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/UI/presentation/view_model_base.dart';
import 'core/router/router.gr.dart';
import 'features/features_landing/presentation/view_models/view_model_landing.dart';
import 'features/features_main/presentation/view_models/leader_board/view_model_leader_board.dart';
import 'features/features_main/presentation/view_models/view_model_bottom_navigation.dart';

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
    // ChangeNotifierProvider(create: (context) => InteractionProvider()),
  ];
}
