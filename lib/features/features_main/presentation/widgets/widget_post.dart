// ignore_for_file: must_be_immutable
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gatezero_demo/core/UI/shared/mock_lists.dart';
import 'package:gatezero_demo/features/features_main/presentation/widgets/view_comment.dart';
import 'package:gatezero_demo/providers/provider_user.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:like_button/like_button.dart';
import 'package:screenshot/screenshot.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/shared/colors.dart';
import '../../../../core/UI/widgets/rounded_text_field.dart';
import '../../../../core/utils/utilities_arguments.dart';
import '../../../../core/utils/utilities_general.dart';
import '../../../../models/model_comment.dart';
import '../../data/models/model_post.dart';
import '../../../../models/model_user.dart';
import '../../../../providers/provider_feed.dart';
import '../../../../core/UI/widgets/or_divider.dart';
import '../../../../core/UI/widgets/over_scroll.dart';
import '../../../../core/UI/widgets/gatezero_avatar.dart';
import '../../../../core/UI/widgets/widget_loading.dart';

/// TODO: Revise
class PostWidget extends StatefulWidget {
  PostModel postModel;
  PostWidget({this.postModel});
  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    UserModel _currentUser = Provider.of<UserProvider>(context, listen: false).currentUser;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          _getPostBody(widget.postModel.likers, _currentUser),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(children: [_getLikeButton(_currentUser), _getCommentsButton(), Spacer(), _getShareButton()]),
          ),
        ],
      ),
    );
  }

  _getLikeButton(UserModel _currentUser) => LikeButton(
        size: 30,
        bubblesColor: BubblesColor(dotLastColor: Colors.purple, dotSecondaryColor: Colors.purple, dotPrimaryColor: Colors.purple),
        circleColor: CircleColor(start: Colors.purple, end: Colors.purple),
        isLiked: widget.postModel.likers.contains(_currentUser.uID),
        onTap: (isLiked) async {
          if (!isLiked) {
            widget.postModel.likers.add(_currentUser.uID);
          } else
            widget.postModel.likers.remove(_currentUser.uID);
          return !isLiked;
          // return await FeedService.likeOnTap(_currentUser.uID, isLiked, widget.postModel);
        },
        likeBuilder: (bool isLiked) => Icon(
          isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          color: isLiked ? UIColors.primaryColor : Colors.grey,
        ),
      );

  _getCommentsButton() => IconButton(onPressed: () => _getCommentsSheet(), icon: Icon(Icons.comment_outlined, size: 22));

  _getPostBody(_likers, UserModel _currentUser) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: TextButton(
              child: GateZeroAvatar(image: widget.postModel.publisherAvatar, fallBackImage: Image.asset(UIAssets.generalLogo)),
              style: TextButton.styleFrom(padding: EdgeInsets.all(6.0), shape: CircleBorder()),
              onPressed: () {
                if (GeneralUtils.hasData(widget.postModel.publisherID)) {
                  Navigator.pushNamed(
                    context,
                    '/screen_other_profile',
                    arguments: OtherProfileScreenArgs(friendID: widget.postModel.publisherID),
                  );
                }
              },
            ),
            title: Text(widget.postModel.publisherName ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(GeneralUtils.getReadableDate()),
          ),
          Screenshot(
            controller: _ssController,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  widget.postModel.photo,
                  height: 350,
                  fit: BoxFit.fitHeight,
                  errorBuilder: (context, e, trace) => Icon(Icons.error),
                ),
                GestureDetector(
                  onDoubleTap: () async {
                    if (!widget.postModel.likers.contains(_currentUser.uID)) {
                      widget.postModel.likers.add(_currentUser.uID);
                    } else
                      widget.postModel.likers.remove(_currentUser.uID);
                    setState(() => _opacity = 1.0);
                    Timer(Duration(milliseconds: 500), () => setState(() => _opacity = 0.0));
                  },
                  child: Container(
                    height: 350,
                    color: Colors.transparent,
                    width: 350 / size.aspectRatio,
                    child: AnimatedOpacity(
                      opacity: _opacity,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: Icon(
                        !widget.postModel.likers.contains(_currentUser.uID) ? FontAwesomeIcons.heartBroken : Icons.favorite_rounded,
                        size: 150,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getCommentsSheet() async {
    TextEditingController _controller = TextEditingController();
    showBarModalBottomSheet(
        context: context,
        enableDrag: true,
        builder: (context) {
          final _inset = MediaQuery.of(context).viewInsets;
          return StatefulBuilder(builder: (context, setter) {
            Map comms = {};
            Provider.of<FeedProvider>(context, listen: true).postList.forEach((element) {
              if (element.id == widget.postModel.id) {
                comms = element.comments;
              }
            });
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    OrDivider(text: 'Yorumlar'),
                    SizedBox(height: 10),
                    Expanded(
                      child: OverScroll(
                        child: ListView(
                          children: [
                            for (CommentModel comment in comms.values.toList())
                              // CommentView(commentModel: CommentModel.fromJSON(comment), postModel: widget.postModel)
                              CommentView(commentModel: comment, postModel: widget.postModel)
                          ],
                        ),
                      ),
                    ),
                    RoundedTextField(
                      controller: _controller,
                      hintText: 'Yorum yap...',
                      icon: Icons.add_comment_rounded,
                      suffixIcon: GestureDetector(
                        child: Icon(Icons.send_rounded, color: UIColors.primaryColor),
                        onTap: () async {
                          CommentModel _newComment = CommentModel(
                            comment: _controller.text,
                            uID: "0",
                            timeStamp: DateTime.now().toString().substring(0, 19),
                            commentID: DateTime.now().toString().substring(0, 19) + "0",
                            author: Mocks.mockUserList[0],
                          );
                          await Provider.of<FeedProvider>(context, listen: false)
                              .addComment(postModel: widget.postModel, commentModel: _newComment);
                          _controller.clear();
                          FocusManager.instance.primaryFocus.unfocus();
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(height: _inset.bottom),
                  ],
                ),
              ),
            );
          });
        });
  }

  bool _isLoading = false;
  ScreenshotController _ssController = ScreenshotController();
  _getShareButton() => IconButton(
        icon: _isLoading ? LoadingWidget(size: 22) : Icon(Icons.share_rounded, size: 22),
        onPressed: () async {
          setState(() => _isLoading = true);
          await GeneralUtils.takeSSandShare(_ssController, ssName: widget.postModel.id)
              .whenComplete(() => setState(() => _isLoading = false));
        },
      );
}
