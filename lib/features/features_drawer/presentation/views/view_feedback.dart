import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../core/UI/shared/colors.dart';
import '../../../../core/UI/shared/lists.dart';
import '../../../../core/UI/shared/utils.dart';
import '../../../../core/UI/widgets/async_button.dart';
import '../../../../core/UI/widgets/gatezero_dropdown.dart';
import '../../../../core/services/service_localization.dart';
import '../../../../core/utils/utilities_constants.dart';
import '../../../../core/utils/utilities_general.dart';

class FeedbackView extends StatefulWidget {
  @override
  _FeedbackViewState createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  String _dropdownSubjectValue = LocalizationService.texts.notSelectedText;
  String _dropdownDetailValue = LocalizationService.texts.notSelectedText;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationService.texts.drawerItemFeedback)),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        children: <Widget>[
          SizedBox(height: 30),
          Text(LocalizationService.texts.leaveUsAMessage, style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
          SizedBox(height: 30),
          _getTextFields(),
          SizedBox(height: 15),
          AsyncButton(
            label: LocalizationService.texts.sendButtonText,
            onPressed: () async {
              if (_controller.text.isNotEmpty) {
                UIUtils.showToast("Geri bildirimini aldık, teşekkür ederiz!", success: true);
                setState(() {
                  FocusManager.instance.primaryFocus.nextFocus();
                  _controller.clear();
                  _dropdownSubjectValue = LocalizationService.texts.notSelectedText;
                  _dropdownDetailValue = LocalizationService.texts.notSelectedText;
                });
              } else {
                UIUtils.showToast("Lütfen bir geri bildirim yaz!", success: false);
              }
            },
          ),
          SizedBox(height: 20),
          Text(LocalizationService.texts.contactUsOtherTitle, textAlign: TextAlign.center, style: TextStyle(fontSize: 17)),
          SizedBox(height: 20),
          _getButtons(),
        ],
      ),
    );
  }

  _getTextFields() => Column(
        children: [
          GateZeroDropdown(
            value: _dropdownSubjectValue,
            items: UILists.feedbackSubjectDropdown,
            onChanged: _dropdownDetailValue != 'Seçilmedi' ? null : (index) => setState(() => _dropdownSubjectValue = index),
          ),
          SizedBox(height: 15),
          if (_dropdownSubjectValue != 'Diğer')
            Column(
              children: [
                GateZeroDropdown(
                  value: _dropdownDetailValue,
                  items: UILists.feedbackAppDropdown,
                  onChanged: _dropdownSubjectValue == 'Seçilmedi' ? null : (index) => setState(() => _dropdownDetailValue = index),
                ),
                SizedBox(height: 15),
              ],
            ),
          TextField(
            minLines: 1,
            maxLines: 3,
            cursorColor: UIColors.primaryColor,
            controller: _controller,
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) => setState(() {}),
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              fillColor: UIColors.fillColor,
              hintText: 'Mesajın (Boş Bırakılabilir)',
              contentPadding: EdgeInsets.symmetric(vertical: 20.0),
              prefixIcon: Icon(Icons.message, color: UIColors.primaryColor, size: 25),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide.none),
            ),
          ),
        ],
      );

  Row _getButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () async => await GeneralUtils.launchUrl(Constants.WEGithubLink),
            child: Icon(FontAwesomeIcons.github, color: Colors.black, size: 35),
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: () async => await GeneralUtils.launchUrl(Constants.WEInstagramLink),
            child: Icon(FontAwesomeIcons.instagram, color: Color(0xfffb3958), size: 35),
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: () async => await GeneralUtils.launchUrl(Constants.WEGooglePlayLink),
            child: Icon(FontAwesomeIcons.googlePlay, color: Color(0xff1DA1F2), size: 35),
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: () async => await GeneralUtils.launchUrl(Constants.WEGooglePlayLink),
            child: Icon(FontAwesomeIcons.appStore, color: Color(0xff1DA1F2), size: 35),
          ),
        ],
      );
}
