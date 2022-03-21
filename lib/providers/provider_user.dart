import 'package:flutter/material.dart';
import 'package:gatezero_demo/UI/design_materials/mock_lists.dart';
import 'package:gatezero_demo/models/model_friend.dart';
import '../models/model_user.dart';

class UserProvider extends ChangeNotifier {
  UserModel currentUser = UserModel(
    uID: "0",
    name: "Aysu Keçeci",
    superHero: "Wonder Woman",
    company: "GateZero",
    city: "İstanbul",
    coins: 8312,
    recycled: 13021,
    exp: 12130,
    avatar: Mocks.avatarAysu,
    friends: <FriendModel>[],
  );

  updateCoin(int value) {
    currentUser.coins += value;
    notifyListeners();
  }

  /// TODO: add friend function.
  addFriend(FriendModel friendData) {
    currentUser.friends.add(friendData);
    notifyListeners();
  }
}
