import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class LocalizationService {
  static List<Locale> supportedLocales = [Locale('tr', 'TR'), Locale('en', 'US')];
  static LocalizedText texts = LocalizedText();
  static String translationsPath = 'translations';
}

class LocalizedText {
  String helloWord = 'helloWorld'.tr();

  /// Generals
  String appName = 'appName'.tr();
  String teamName = 'teamName'.tr();
  String stationName = 'stationName'.tr();

  /// Utils
  String zeroNumber = 'zeroNumber'.tr();
  String oneNumber = 'oneNumber'.tr();
  String coinText = 'coinText'.tr();
  String noAccountQuestion = 'noAccountQuestion'.tr();
  String accountQuestion = 'accountQuestion'.tr();
  String genericError = 'genericError'.tr();
  String genericErrorLong = 'genericErrorLong'.tr();

  /// Text Field Texts
  String hintTextMail = 'hintTextMail'.tr();
  String hintTextPassword = 'hintTextPassword'.tr();
  String hintTextName = 'hintTextName'.tr();
  String hintTextCity = 'hintTextCity'.tr();
  String hintTextAddress = 'hintTextAddress'.tr();
  String hintTextCompany = 'hintTextCompany'.tr();
  String hintTextReferral = 'hintTextReferral'.tr();
  String forgotPassword = 'forgotPassword'.tr();
  String cannotBeLeftEmptyAlert = 'cannotBeLeftEmpty'.tr();
  String phoneValidationAlert = 'phoneValidation'.tr();
  String invalidEmailAlert = 'invalidEmailAlert'.tr();
  String passwordTooShortAlert = 'passwordTooShortAlert'.tr();

  /// Drawer Items
  String drawerItemBadges = 'drawerItemBadges'.tr();
  String drawerItemChallenges = 'drawerItemChallenges'.tr();
  String drawerItemInvite = 'drawerItemInvite'.tr();
  String drawerItemTraining = 'drawerItemTraining'.tr();
  String drawerItemFeedback = 'drawerItemFeedback'.tr();
  String drawerItemFAQ = 'drawerItemFAQ'.tr();
  String drawerItemSearch = 'drawerItemSearch'.tr();

  /// Button texts
  String sendButtonText = 'sendButtonText'.tr();
  String saveButtonText = 'saveButtonText'.tr();
  String loginButtonText = 'loginButtonText'.tr();
  String signUpButtonText = 'signUpButtonText'.tr();
  String returnButtonText = 'returnButtonText'.tr();
  String cancelButtonText = 'cancelButtonText'.tr();
  String acceptButtonText = 'acceptButtonText'.tr();
  String shareButtonText = 'shareButtonText'.tr();

  /// UI
  String copiedToClipBoard = 'copiedToClipBoard'.tr();
  String firebaseAuthErrorWrongPassword = 'firebaseAuthErrorWrongPassword'.tr();
  String firebaseAuthErrorUserNotFound = 'firebaseAuthErrorUserNotFound'.tr();
  String firebaseAuthErrorNetworkFail = 'firebaseAuthErrorNetworkFail'.tr();
  String firebaseAuthErrorTooManyRequest = 'firebaseAuthErrorTooManyRequest'.tr();
  String informationTitle = 'informationTitle'.tr();
  String informationComingSoon = 'informationComingSoon'.tr();
  String leaveUsAMessage = 'leaveUsAMessage'.tr();
  String notSelectedText = 'notSelectedText'.tr();
  String couldNotFindAResult = 'couldNotFindAResult'.tr();
  String connectionTimedOut = 'connectionTimedOut'.tr();
  String herostationInUse = 'herostationInUse'.tr();
  String mailWillBeSentMessage = 'mailWillBeSentMessage'.tr();

  /// Pages ///
  String welcomePageTitle = 'welcomePageTitle'.tr();
  String addStoryText = 'addStoryText'.tr();
  String mapFeedbackTitle = 'mapFeedbackTitle'.tr();
  String mapFeedbackInfoTitle = 'mapFeedbackInfoTitle'.tr();
  String mapFeedbackInfoBody = 'mapFeedbackInfoBody'.tr();
  String mapFeedbackSubject = 'mapFeedbackSubject'.tr();
  String mapFeedbackMessage = 'mapFeedbackMessage'.tr();

  /// QR Pages
  String qrPageGreeting = 'qrPageGreeting'.tr();
  String qrPageInstruction = 'qrPageInstruction'.tr();
  String qrPageQRButton = 'qrPageQRButton'.tr();
  String qrPageBraceletButton = 'qrPageBraceletButton'.tr();
  String qrPageInstruction1 = 'qrPageInstruction1'.tr();
  String qrPageInstruction2 = 'qrPageInstruction2'.tr();
  String qrPageInstruction3 = 'qrPageInstruction3'.tr();
  String qrPageInstruction4 = 'qrPageInstruction4'.tr();
  String qrPageInstruction5 = 'qrPageInstruction5'.tr();
  String qrPageInstruction6 = 'qrPageInstruction6'.tr();
  String qrScreenBodyText = 'qrScreenBodyText'.tr();
  String qrScreenGreeting = 'qrScreenGreeting'.tr();
  String waitingText0 = 'waitingText0'.tr();
  String waitingText1 = 'waitingText1'.tr();
  String waitingText2 = 'waitingText2'.tr();

  /// Prizes
  String prizePageTitle = 'prizePageTitle'.tr();
  String joinTheDraw = 'joinTheDraw'.tr();
  String joinTheDrawSuccess = 'joinTheDrawSuccess'.tr();
  String joinTheDrawFailure = 'joinTheDrawFailure'.tr();

  /// Profile Pages
  String profilePageTitle = 'profilePageTitle'.tr();
  String editProfileTitle = 'editProfileTitle'.tr();
  String editProfileAvatarHint = 'editProfileAvatarHint'.tr();
  String zScoreEarned = 'zScoreEarned'.tr();
  String impacted = 'impacted'.tr();
  String carbonFootprint = 'carbonFootprint'.tr();
  String settings = 'settings'.tr();
  String exit = 'exit'.tr();

  /// Leader Board Pages
  String leaderBoardPageTitle = 'leaderBoardPageTitle'.tr();
  String leaderBoardTabTitle1 = 'leaderBoardTabTitle1'.tr();
  String leaderBoardTabTitle2 = 'leaderBoardTabTitle2'.tr();
  String friendProfileLevel = 'friendProfileLevel'.tr();
  String friendProfileTotalCoin = 'friendProfileTotalCoin'.tr();
  String friendProfileRecycled = 'friendProfileRecycled'.tr();
  String friendProfileAddFriend = 'friendProfileAddFriend'.tr();
  String friendProfileRemoveFriend = 'friendProfileRemoveFriend'.tr();
  String friendProfileDuelInviteInfo = 'friendProfileDuelInviteInfo'.tr();
  String leaderBoardFriendsTabNoFriendText = 'leaderBoardFriendsTabNoFriendText'.tr();
  String cannotInviteThemselves = 'cannotInviteThemselves'.tr();

  /// DrawerPages
  /// Badges
  String badge1Detail = 'badge1Detail'.tr();
  String badge2Detail = 'badge2Detail'.tr();
  String badge3Detail = 'badge3Detail'.tr();
  String badge4Detail = 'badge4Detail'.tr();
  String badge5Detail = 'badge5Detail'.tr();
  String badge6Detail = 'badge6Detail'.tr();
  String badge1Title = 'badge1Title'.tr();
  String badge2Title = 'badge2Title'.tr();
  String badge3Title = 'badge3Title'.tr();
  String badge4Title = 'badge4Title'.tr();
  String badge5Title = 'badge5Title'.tr();
  String badge6Title = 'badge6Title'.tr();
  String badgeQuestion = 'badgeQuestion'.tr();

  /// Duels
  String duelInvitesTitle = 'duelInvitesTitle'.tr();
  String activeDuelsTitle = 'activeDuelsTitle'.tr();
  String duelTimeText = 'duelTimeText'.tr();
  String duelingWithText = 'duelingWithText'.tr();
  String incomingDuelInvitations = 'incomingDuelInvitations'.tr();
  String challengedText = 'challengedText'.tr();
  String doNotHaveDuelInvite = 'doNotHaveDuelInvite'.tr();
  String waitingForDuelInviteResponse = 'waitingForDuelInviteResponse'.tr();

  /// Invite
  String invitePageText = 'invitePageText'.tr();
  String invitePageHintText = 'invitePageHintText'.tr();

  /// Feedback
  String feedBackDropdownAlert = 'feedBackDropdownAlert'.tr();
  String contactUsOtherTitle = 'contactUsOtherTitle'.tr();

  /// Machine
  String transitionPageTitle = 'transitionPageTitle'.tr();
  String transitionPageInfo = 'transitionPageInfo'.tr();
  String interactionPageTitle = 'interactionPageTitle'.tr();
  String interactionPageInfo = 'interactionPageInfo'.tr();
  String interactionPageQuestion = 'interactionPageQuestion'.tr();
  String interactionPageDialogOption = 'interactionPageDialogOption'.tr();
}
