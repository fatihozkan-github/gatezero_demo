import 'package:flutter/material.dart';
import 'package:gatezero_demo/core/UI/presentation/view_base.dart';
import 'package:gatezero_demo/core/UI/presentation/view_model_base.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/UI/widgets/async_button.dart';
import '../../../../../core/router/router.gr.dart';
import '../../../../../core/utils/utilities_general.dart';
import '../../../data/models/model_challenge.dart';

class ChallengeDetailView extends StatefulWidget {
  final ChallengeModel challengeData;
  ChallengeDetailView({@required this.challengeData});
  @override
  State<ChallengeDetailView> createState() => _ChallengeDetailViewState();
}

class _ChallengeDetailViewState extends State<ChallengeDetailView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: BaseViewModel(),
      builder: (_, BaseViewModel vm, __) {
        return Scaffold(
          appBar: AppBar(title: Text(widget.challengeData.challengeTitle.toString())),
          body: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            children: [
              SizedBox(height: 12),
              ClipRRect(borderRadius: BorderRadius.circular(20.0), child: Image.asset(widget.challengeData.challengeImage)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(widget.challengeData.challengeInfo, textAlign: TextAlign.center),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AsyncButton(
                    useElevatedButton: true,
                    useIconElevatedButton: true,
                    iconWidget: Icon(Icons.add_a_photo_rounded),
                    onPressed: () async {
                      var imageData = await GeneralUtils.pickImage(src: ImageSource.camera);
                      vm.appRouter
                          .push(ChallengeShareViewRoute(imageData: imageData.readAsBytesSync(), challengeData: widget.challengeData));
                    },
                    label: 'Take a photo',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
