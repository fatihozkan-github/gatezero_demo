import 'package:gatezero_demo/core/UI/presentation/view_base.dart';
import 'package:flutter/material.dart';

import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/widgets/rounded_list_tile.dart';
import '../../../../core/UI/widgets/rounded_text_field.dart';
import '../../../../core/router/router.gr.dart';
import '../../../../core/services/service_localization.dart';
import '../../../../core/utils/utilities_general.dart';
import '../view_models/view_model_search.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: SearchViewModel(),
      builder: (_, vm, __) {
        return Scaffold(
          appBar: AppBar(title: Text(LocalizationService.texts.drawerItemSearch)),
          body: Column(
            children: <Widget>[
              SizedBox(height: 10),
              RoundedTextField(
                hintText: 'Ara',
                icon: Icons.search,
                onChanged: (value) => vm.filterUserList(value),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                textCapitalization: TextCapitalization.words,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: vm.userList.length,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  itemBuilder: (context, index) {
                    if (vm.userList.isNotEmpty) {
                      return RoundedListTile(
                        title: Text(vm.userList[index].name),
                        leading: Container(
                          width: 48,
                          height: 48,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image(
                            image: GeneralUtils.hasData(vm.userList[index].avatar)
                                ? AssetImage(vm.userList[index].avatar)
                                : AssetImage(UIAssets.leaderBoardUserIcon),
                            fit: BoxFit.cover,
                          ),
                        ),
                        onPressed: () => vm.appRouter.push(OtherProfileViewRoute(friendModel: vm.userList[index])),
                      );
                    } else
                      return Center(child: Text(LocalizationService.texts.couldNotFindAResult, textAlign: TextAlign.center));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
