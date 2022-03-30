import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/UI/presentation/view_model_base.dart';
import 'core/router/router.gr.dart';
import 'providers/provider_feed.dart';
import 'providers/provider_user.dart';

class Initials {
  static String appTitle = 'GateZero';

  static final _injector = GetIt.instance;

  static void setupInjector() {
    _injector.registerSingleton<AppRouter>(AppRouter());
  }

  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => BaseViewModel()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => FeedProvider()),
  ];
}
