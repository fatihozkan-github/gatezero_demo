import '../../../../core/UI/presentation/view_base.dart';
import '../../../../core/UI/presentation/view_model_base.dart';
import '../../../../core/UI/widgets/rounded_list_tile.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: BaseViewModel(),
      builder: (_, BaseViewModel vm, __) {
        return Scaffold(
          appBar: AppBar(title: Text('Ayarlar')),
          body: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            children: [
              RoundedListTile(
                leading: Icon(Icons.logout, color: Colors.red, size: 25),
                title: Text('Çıkış Yap'),
                trailing: Icon(Icons.chevron_right),
                onPressed: () async => vm.navigateTo('/view_welcome'),
              ),
            ],
          ),
        );
      },
    );
  }
}
