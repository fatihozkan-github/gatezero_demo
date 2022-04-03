import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../features/features_drawer/data/models/model_badge.dart';
import '../../../features/features_drawer/data/models/model_challenge.dart';
import '../../models/model_drawer_item.dart';
import '../../services/service_localization.dart';
import '../../utils/utilities_constants.dart';
import 'assets.dart';
import 'colors.dart';

/// • Lists that are used in various places.
///
/// • Generally, these are lists of UI components.
class UILists {
  static List<TabItem> bottomNavigationItems = [
    TabItem(icon: Image.asset(UIAssets.bottomNavigationHomeIcon)),
    TabItem(icon: Image.asset(UIAssets.bottomNavigationMapIcon, color: UIColors.tertiaryColor)),
    // TabItem(icon: Image.asset(UIAssets.bottomNavigationQRIcon, color: UIColors.tertiaryColor)),
    TabItem(icon: Image.asset(UIAssets.generalLogo, color: UIColors.tertiaryColor)),
    TabItem(icon: Image.asset(UIAssets.bottomNavigationPrivilegeIcon, color: UIColors.tertiaryColor)),
    TabItem(icon: Image.asset(UIAssets.bottomNavigationLeaderBoardIcon, color: UIColors.tertiaryColor)),
  ];

  static List<String> bottomNavigationTitles = [
    LocalizationService.texts.appName,
    LocalizationService.texts.stationName,
    LocalizationService.texts.stationName,
    LocalizationService.texts.prizePageTitle,
    LocalizationService.texts.leaderBoardPageTitle,
  ];

  static List<DrawerItemModel> drawerItems = [
    DrawerItemModel(title: LocalizationService.texts.drawerItemBadges, icon: Icons.local_police_rounded, screen: '/view_badges'),
    DrawerItemModel(title: LocalizationService.texts.drawerItemDuels, icon: Icons.local_fire_department, screen: '/view_duel'),
    DrawerItemModel(
        title: LocalizationService.texts.drawerItemTraining, icon: Icons.collections_bookmark, screen: '/view_training_set'),
    DrawerItemModel(
        title: LocalizationService.texts.drawerItemChallenges, icon: Icons.directions_walk_rounded, screen: '/view_challenges'),
    DrawerItemModel(title: LocalizationService.texts.drawerItemInvite, icon: Icons.share_rounded, screen: '/view_invite'),
    DrawerItemModel(title: LocalizationService.texts.drawerItemFeedback, icon: Icons.feedback_rounded, screen: '/view_feedback'),
  ];

  static List<String> qrPageInstructions = [
    LocalizationService.texts.qrPageInstruction1,
    LocalizationService.texts.qrPageInstruction2,
    LocalizationService.texts.qrPageInstruction3,
    LocalizationService.texts.qrPageInstruction4,
  ];

  static List<String> leaderBoardIcons = [
    UIAssets.leaderBoardFirstUserIcon,
    UIAssets.leaderBoardSecondUserIcon,
    UIAssets.leaderBoardThirdUserIcon,
    UIAssets.leaderBoardGenericIcon,
  ];

  static List<BadgeModel> badges = [
    BadgeModel(
        activeImage: UIAssets.badge1ActiveImage,
        inactiveImage: UIAssets.badge1InactiveImage,
        detailText: LocalizationService.texts.badge1Detail,
        title: LocalizationService.texts.badge1Title),
    BadgeModel(
        activeImage: UIAssets.badge2ActiveImage,
        inactiveImage: UIAssets.badge2InactiveImage,
        detailText: LocalizationService.texts.badge2Detail,
        title: LocalizationService.texts.badge2Title),
    BadgeModel(
        activeImage: UIAssets.badge3ActiveImage,
        inactiveImage: UIAssets.badge3InactiveImage,
        detailText: LocalizationService.texts.badge3Detail,
        title: LocalizationService.texts.badge3Title),
    BadgeModel(
        activeImage: UIAssets.badge4ActiveImage,
        inactiveImage: UIAssets.badge4InactiveImage,
        detailText: LocalizationService.texts.badge4Detail,
        title: LocalizationService.texts.badge4Title),
    BadgeModel(
        activeImage: UIAssets.badge5ActiveImage,
        inactiveImage: UIAssets.badge5InactiveImage,
        detailText: LocalizationService.texts.badge5Detail,
        title: LocalizationService.texts.badge5Title),
    BadgeModel(
        activeImage: UIAssets.badge6ActiveImage,
        inactiveImage: UIAssets.badge6InactiveImage,
        detailText: LocalizationService.texts.badge6Detail,
        title: LocalizationService.texts.badge6Title),
  ];

  static List<List<double>> filters = [
    Constants.NO_FILTER,
    Constants.SEPIA_MATRIX,
    Constants.GREYSCALE_MATRIX,
    Constants.VINTAGE_MATRIX,
    Constants.SWEET_MATRIX
  ];

  // static List<DropdownMenuItem<String>> companyDropdownItems = [
  //   DropdownMenuItem(value: 'Seçilmedi', child: Text('Seçilmedi')),
  //   DropdownMenuItem(value: 'WE', child: Text('WE')),
  //   DropdownMenuItem(value: 'BORUSAN', child: Text('BORUSAN')),
  //   DropdownMenuItem(value: 'FORD', child: Text('FORD')),
  //   DropdownMenuItem(value: 'DİĞER', child: Text('DİĞER')),
  // ];

  static List<DropdownMenuItem> feedbackSubjectDropdown = [
    DropdownMenuItem(value: LocalizationService.texts.notSelectedText, child: Text('Please choose a topic')),
    DropdownMenuItem(value: 'Application Issue', child: Text('There is a problem with the application')),
    DropdownMenuItem(value: 'Other', child: Text('Other')),
  ];

  static List<DropdownMenuItem> feedbackAppDropdown = [
    DropdownMenuItem(value: LocalizationService.texts.notSelectedText, child: Text('Select a relevant detail')),
    DropdownMenuItem(value: 'Application version is incompatible or outdated', child: Text('App version incompatible')),
    DropdownMenuItem(
        value: 'The QR code read is invalid or there is no matching box in the system',
        child: Text('The QR code read is invalid or there is no matching box in the system')),
    DropdownMenuItem(
        value: 'There is an problematic page in the application / The application crashes when taking a certain action',
        child: Text('There is an problematic page in the application / The application crashes when taking a certain action')),
    DropdownMenuItem(
        value: 'Some functions in the application do not work as they should',
        child: Text('Some functions in the application do not work as they should')),
  ];

  static List<String> mockChallengeImages = [
    UIAssets.challengeIcon6,
    UIAssets.challengeIcon7,
    UIAssets.challengeIcon8,
    UIAssets.challengeIcon9,
    UIAssets.challengeIcon10,
    UIAssets.challengeIcon11,
    UIAssets.challengeIcon11,
  ];

  static List<ChallengeModel> challengeList = [
    ChallengeModel(
      challengeTitle: 'Use the Stairs',
      challengeInfo:
          "Don't skip leg day! Take the stairs instead of waiting for the elevator. Both your legs and nature will be grateful to you for this pioneering act.",
      challengeIcon: UIAssets.challengeIcon1,
      challengeImage: UIAssets.challengeStairsImage,
    ),
    ChallengeModel(
      challengeTitle: 'Rinsing',
      challengeInfo:
          "Don't rinse your dishes before you put them in the dishwasher! Avoid wasting water, time and money by saving an average of 10 tons of water per month.",
      challengeIcon: UIAssets.challengeIcon2,
      challengeImage: UIAssets.challengeDishesImage,
    ),
    ChallengeModel(
      challengeTitle: 'Meatless Monday',
      challengeInfo:
          "Join the meat-free movement on an active Monday! Raise awareness with your pioneering movement by not eating meat one day for your health, future and animal rights.",
      challengeIcon: UIAssets.challengeIcon3,
      challengeImage: UIAssets.challengeFoodImage,
    ),
    ChallengeModel(
      challengeTitle: 'Brush Your Teeth',
      challengeInfo:
          "If you are brushing your teeth twice a day (which we hope so :)) you are using too much water. Join the movement for the future by not leaving the water running while brushing or shaving.",
      challengeIcon: UIAssets.challengeIcon4,
      challengeImage: UIAssets.challengeTeethImage,
    ),
    ChallengeModel(
      challengeTitle: 'Recycle',
      challengeInfo:
          "Sort your waste and throw your plastics in the HeroStation box! You can become a pioneer by inviting your friends and gaining a fun, profitable and efficient recycling habit.",
      challengeIcon: UIAssets.challengeIcon5,
      challengeImage: UIAssets.challengeMachineImage,
    ),
  ];

  // static List<DropdownMenuItem> feedbackAppDropdown = [
  //   DropdownMenuItem(value: 'Seçilmedi', child: Text('Konuyla alakalı bir detay seç')),
  //   DropdownMenuItem(value: 'Uygulama versiyonu uyumsuz veya eski', child: Text('Uygulama versiyonu uyumsuz')),
  //   DropdownMenuItem(value: 'QR kod okunmuyor', child: Text('QR kod okunmuyor')),
  //   DropdownMenuItem(
  //       value: 'Okunan QR kod geçersiz veya sistemde eşleşen makine yok',
  //       child: Text('Okunan QR kod geçersiz veya sistemde eşleşen makine yok')),
  //   DropdownMenuItem(value: 'Makine kullanım kısmı bugda kaldı', child: Text('Makine kullanım kısmı bugda kaldı')),
  //   DropdownMenuItem(
  //       value: 'Uygulamada açılmayan sayfa var / Belirli bir aksiyon alınca uygulama çöküyor',
  //       child: Text('Uygulamada açılmayan sayfa var / Belirli bir aksiyon alınca uygulama çöküyor')),
  //   DropdownMenuItem(
  //       value: 'Uygulamada bazı fonksiyonlar olması gerektiği gibi çalışmıyor',
  //       child: Text('Uygulamada bazı fonksiyonlar olması gerektiği gibi çalışmıyor')),
  // ];
  ///
  // static List<ChallengeModel> challengeList = [
  //   ChallengeModel(
  //     challengeTitle: 'Merdivenleri Kullan',
  //     challengeInfo:
  //         'Bacak gününü atlama! Asansörü beklemek yerine merdivenleri kullan. Bu öncü hareket için hem bacakların hem de doğa sana minnettar olacak.',
  //     challengeIcon: UIAssets.challengeIcon1,
  //     challengeImage: UIAssets.challengeStairsImage,
  //   ),
  //   ChallengeModel(
  //     challengeTitle: 'Sudan Geçirme',
  //     challengeInfo:
  //         'Bulaşıklarını makineye koymadan önce sudan geçirme! Ayda ortalama 10 ton su tasarrufu sağlayarak su, zaman ve maddi israftan kaçın.',
  //     challengeIcon: UIAssets.challengeIcon2,
  //     challengeImage: UIAssets.challengeDishesImage,
  //   ),
  //   ChallengeModel(
  //     challengeTitle: 'Etsiz Pazartesi',
  //     challengeInfo:
  //         'Hareketli pazartesi gününde etsiz beslenme hareketine katıl! Sağlığın, geleceğin ve hayvan hakları için bir gün et yemeyerek öncü hareketinle farkındalık yarat.',
  //     challengeIcon: UIAssets.challengeIcon3,
  //     challengeImage: UIAssets.challengeFoodImage,
  //   ),
  //   ChallengeModel(
  //     challengeTitle: 'Koruyarak Fırçala',
  //     challengeInfo:
  //         'Eğer günde 2 kez dişlerini fırçalıyorsan (Ki umarız öyledir :)) çok fazla su kullanıyorsun demektir. Dişini fırçalarken veya tıraş olurken suyun açık bırakmayarak gelecek için harekete katıl.',
  //     challengeIcon: UIAssets.challengeIcon4,
  //     challengeImage: UIAssets.challengeTeethImage,
  //   ),
  //   ChallengeModel(
  //     challengeTitle: 'Geri Dönüştür',
  //     challengeInfo:
  //         'Atıklarını ayrıştırarak plastiklerini HeroStation kutusuna at! Arkadaşlarını davet ederek eğlenceli, kazançlı, verimli geri dönüşüm alışkanlığı kazanarak öncü olabilirsin.',
  //     challengeIcon: UIAssets.challengeIcon5,
  //     challengeImage: UIAssets.challengeMachineImage,
  //   ),
  // ];

  static List<String> afterUsageFeedbackList = [
    LocalizationService.texts.waitingText0,
    LocalizationService.texts.waitingText1,
    LocalizationService.texts.waitingText2,
  ];
}
