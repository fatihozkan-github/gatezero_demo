import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gatezero_demo/providers/provider_user.dart';
import 'package:provider/provider.dart';

import '../../../../core/UI/widgets/we_avatar.dart';
import '../../../../core/UI/widgets/rounded_list_tile.dart';
import '../../../../core/utils/utilities_general.dart';
import '../../../../models/model_comment.dart';
import '../../../../models/model_post.dart';
import '../../../../models/model_user.dart';
import '../../../../providers/provider_feed.dart';

class CommentView extends StatefulWidget {
  final CommentModel commentModel;
  final PostModel postModel;
  CommentView({this.commentModel, this.postModel});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  @override
  void initState() {
    // _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel _currentUser = Provider.of<UserProvider>(context, listen: true).currentUser;
    return RoundedListTile(
      leading: WEAvatar(image: (widget.commentModel.author.avatar)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.commentModel.author.name ?? ' ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              SizedBox(width: 5),
              Text(GeneralUtils.getReadableDate(timeStamp: widget.commentModel.timeStamp) ?? ' ',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey[400])),
            ],
          ),
          if (_currentUser.uID == widget.commentModel.author.id)
            GestureDetector(
              child: Text('Yorumumu Sil', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.red)),
              onTap: () async {
                await Provider.of<FeedProvider>(context, listen: false)
                    .removeComment(postModel: widget.postModel, commentModel: widget.commentModel);
                setState(() {});
              },
            ),
          SizedBox(height: 10),
        ],
      ),
      subTitle: ExpandableText(
        padding: EdgeInsets.all(4.0),
        backGroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        textWidget:
            Text(widget.commentModel.comment ?? ' ', maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15)),
      ),
    );
  }
}
