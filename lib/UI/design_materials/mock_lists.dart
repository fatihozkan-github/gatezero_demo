import 'package:flutter/cupertino.dart';
import 'package:gatezero_demo/UI/design_materials/DM_assets.dart';
import 'package:gatezero_demo/models/model_comment.dart';
import 'package:gatezero_demo/models/model_friend.dart';
import 'package:gatezero_demo/models/model_prize.dart';
import 'package:gatezero_demo/models/model_story.dart';
import 'package:gatezero_demo/models/model_post.dart';

class Mocks {
  /// Assets
  static String amazonImage = "assets/mocks/prizes/amazon.png";
  static String givinImage = "assets/mocks/prizes/givin.png";
  static String wwfImage = "assets/mocks/prizes/wwf.png";

  /// avatars
  static String avatarFatih = "assets/mocks/profile_pics/pp_fatih.png";
  static String avatarAysu = "assets/mocks/profile_pics/pp_aysu.png";
  static String avatar0 = "assets/mocks/profile_pics/avatar0.png";
  static String avatar1 = "assets/mocks/profile_pics/avatar1.png";
  static String avatar2 = "assets/mocks/profile_pics/avatar2.png";
  static String avatar3 = "assets/mocks/profile_pics/avatar3.png";
  static String avatar4 = "assets/mocks/profile_pics/avatar4.png";
  static String avatar5 = "assets/mocks/profile_pics/avatar5.png";
  static String avatar6 = "assets/mocks/profile_pics/avatar6.png";
  static String avatar7 = "assets/mocks/profile_pics/avatar7.png";
  static String avatar8 = "assets/mocks/profile_pics/avatar8.png";

  /// Posts
  static String post1 = "assets/mocks/posts/mock_post.jpeg";
  static String post2 = "assets/mocks/posts/mock_post2.jpeg";

  /// Lists
  static List<PrizeModel> mockPrizeList = [
    PrizeModel(
      id: "bTUGJgapq4qbpxYbRkbT",
      cost: 50,
      photo: amazonImage,
      title: "Amazon'dan 50 TL hediye çeki!",
      subTitle:
          "Bu çekilişe katılarak amazon.com.tr den yapacağın alışverişlerde kullanabileceğin 50 TL değerinde çek kazanabilirsin.",
    ),
    PrizeModel(
      id: "f5KJO9zuBieF8DVVGxNg",
      cost: 500,
      photo: wwfImage,
      title: "WWF T-shirt",
      subTitle: "Bu çekilişe katılarak WWF marketten  istediğin bir T-shirt hediye kazanma şansını yakala.",
    ),
    PrizeModel(
      id: "V6GfZSZdWFzVRs2vktal",
      cost: 5000,
      photo: givinImage,
      title: "Givin'den sweatshirt",
      subTitle: "Bu çekilişe katılarak givinden istediğin bir sweatshirt'ü kazanma şansını yakala.",
    ),
  ];

  static List<FriendModel> mockUserList = [
    FriendModel(
      id: "0",
      name: "Aysu Keçeci",
      superhero: "Wonder Woman",
      avatar: avatarAysu,
      level: 3,
      coins: 160,
      recycled: 400,
    ),
    FriendModel(
      id: "1",
      name: "Fatih Özkan",
      superhero: "Wolverine",
      avatar: avatarFatih,
      level: 2,
      coins: 60,
      recycled: 300,
    ),
    FriendModel(
      id: "2",
      name: "Dilek Gördük",
      superhero: "Spider-Man",
      avatar: avatar0,
      level: 3,
      coins: 110,
      recycled: 210,
    ),
    FriendModel(
      id: "3",
      name: "Mukadder Ayık",
      superhero: "Captain America",
      avatar: avatar1,
      level: 1,
      coins: 10,
      recycled: 12,
    ),
    FriendModel(
      id: "4",
      name: "Fethiye Dayı",
      superhero: "Doctor Strange",
      avatar: avatar2,
      level: 2,
      coins: 60,
      recycled: 300,
    ),
    FriendModel(
      id: "5",
      name: "Ezgi Gizem Yırgal",
      superhero: "The Hulk",
      avatar: avatar3,
      level: 12,
      coins: 610,
      recycled: 3230,
    ),
    FriendModel(
      id: "6",
      name: "Halil Can Yüksel",
      superhero: "Thor",
      avatar: avatar4,
      level: 4,
      coins: 160,
      recycled: 320,
    ),
    FriendModel(
      id: "7",
      name: "Can Boran",
      superhero: "Daredevil",
      avatar: avatar5,
      level: 7,
      coins: 660,
      recycled: 213,
    ),
    FriendModel(
      id: "8",
      name: "Mehmet Nuri Yabul",
      superhero: "Storm",
      avatar: avatar6,
      level: 11,
      coins: 231,
      recycled: 354,
    ),
    FriendModel(
      id: "9",
      name: "Fuat Kıraslan",
      superhero: "Professor X",
      avatar: avatar7,
      level: 7,
      coins: 660,
      recycled: 213,
    ),
    FriendModel(
      id: "10",
      name: "Fuat Kıraslan",
      superhero: "Black Panther",
      avatar: avatar8,
      level: 5,
      coins: 461,
      recycled: 315,
    ),
  ];

  static List<PostModel> mockPostList = [
    PostModel(
      id: "0",
      photo: post1,
      publisherAvatar: avatarFatih,
      publisherName: "Fatih Özkan",
      timeStamp: DateTime.now().toString(),
      likers: [],
      comments: {"0": CommentModel(uID: "0", comment: "Kolaydı.", timeStamp: DateTime.now().toString(), author: mockUserList[1])},
    ),
    PostModel(
      id: "2",
      photo: post2,
      publisherAvatar: UIAssets.generalLogo,
      publisherName: "GateZero",
      timeStamp: DateTime.now().toString(),
      likers: [],
      comments: {},
    ),
  ];

  static List<StoryModel> mockStoryList = [
    StoryModel(
      publisherID: "0",
      publisherName: "GateZero Team",
      shareTime: DateTime.now().toString(),
      thumbNailImage: UIAssets.generalLogo,
      // image:
    ),
  ];
}
