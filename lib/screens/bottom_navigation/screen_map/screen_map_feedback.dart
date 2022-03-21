import 'package:flutter/material.dart';

import '../../../UI/components/rounded_button.dart';
import '../../../UI/components/rounded_text_field.dart';
import '../../../UI/design_materials/DM_colors.dart';
import '../../../UI/design_materials/DM_utils.dart';

class MapFeedbackScreen extends StatefulWidget {
  @override
  State<MapFeedbackScreen> createState() => _MapFeedbackScreenState();
}

class _MapFeedbackScreenState extends State<MapFeedbackScreen> {
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
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: <Widget>[
            SizedBox(height: 40),
            Center(
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    boxShadow: [BoxShadow(color: UIColors.primaryColor, offset: Offset(15, 15))],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Kirli Olduğunu Düşündüğün Bölgeyi Bize Bildir!',
                        style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(_infoMessage, style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.center),
                    ],
                  ),
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
        ),
      ),
    );
  }
}
