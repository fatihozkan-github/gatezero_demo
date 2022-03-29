import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../../core/UI/shared/utils.dart';
import '../../../../../core/UI/shared/colors.dart';
import '../../../../../core/UI/widgets/rounded_button.dart';
import '../../../../../core/UI/widgets/rounded_text_field.dart';

class MapFeedbackView extends StatefulWidget {
  @override
  State<MapFeedbackView> createState() => _MapFeedbackViewState();
}

class _MapFeedbackViewState extends State<MapFeedbackView> {
  final String _infoMessage = "WE topluluğu ile birlikte alanı temizlemek için etkinlik düzenleme isteği gönderebilirsin.";
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Etkinlik İsteği')),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[850],
                  boxShadow: [BoxShadow(color: UIColors.primaryColor, offset: Offset(10, 10))],
                ),
                child: Column(
                  children: [
                    Text('Kirli Olduğunu Düşündüğün Bölgeyi Bize Bildir!')
                        .textStyle(TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold))
                        .textAlignment(TextAlign.center),
                    SizedBox(height: 5),
                    Text(_infoMessage).textStyle(TextStyle(fontSize: 15, color: Colors.white)).textAlignment(TextAlign.center),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            RoundedTextField(hintText: 'Konu', icon: Icons.mail_rounded, controller: _subjectController),
            RoundedTextField(
              hintText: 'Mesajınız',
              icon: Icons.message,
              maxLines: null,
              textInputAction: TextInputAction.newline,
              controller: _messageController,
            ),
            SizedBox(height: 15),
            RoundedButton(
              text: 'Gönder',
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  if (_subjectController.text.isNotEmpty && _messageController.text.isNotEmpty) {
                    UIUtils.showToast("Mesajını aldık, en kısa sürede harekete geçeceğiz!", success: true, shortDuration: false);
                    setState(() {
                      FocusManager.instance.primaryFocus.nextFocus();
                      _subjectController.clear();
                      _messageController.clear();
                    });
                  }
                }
              },
            ),
            SizedBox(height: 20),
          ],
        ).paddingDirectional(horizontal: 15.0),
      ),
    );
  }
}