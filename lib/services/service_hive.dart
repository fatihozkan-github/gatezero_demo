import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:hive/hive.dart';

class HiveService {
  static Box<dynamic> hive;

  static final String hiveISLOGGEDIN = 'isLoggedIn';
  static final String hiveISFIRSTTIMER = 'isFirstTimer';
  static final String hiveISEDUCATED = 'isEducated';
  static final String hiveTHEME = 'selectedTheme';
  static final String hiveFEEDBACKNUMBER = 'feedbackNumber';
  static final String hiveCHALLENGESTEP = 'challengeStep';

  static setLoginInfo({bool value}) async => await hive.put(hiveISLOGGEDIN, value);

  static getLoginInfo() => hive.get(hiveISLOGGEDIN, defaultValue: false);

  static setIsFirstTimerInfo({bool value}) async => await hive.put(hiveISFIRSTTIMER, value ?? true);

  static getIsFirstTimerInfo() => hive.get(hiveISFIRSTTIMER, defaultValue: true);

  /// Change to bool
  static setThemeInfo({bool value}) async => await hive.put(hiveTHEME, value ?? AdaptiveThemeMode.light);

  static getThemeInfo() => hive.get(hiveTHEME, defaultValue: AdaptiveThemeMode.light);

  static setFeedBackNumber({int value}) async => await hive.put(hiveFEEDBACKNUMBER, value ?? 0);

  static getFeedBackNumber() => hive.get(hiveFEEDBACKNUMBER, defaultValue: 0);

  static setChallengeStep({int value}) async => await hive.put(hiveCHALLENGESTEP, value ?? 1);

  static getChallengeStep() => hive.get(hiveCHALLENGESTEP, defaultValue: 1);
}
