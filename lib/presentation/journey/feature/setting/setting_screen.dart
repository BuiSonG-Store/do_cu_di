import 'package:do_cu_di/common/const/logo_const.dart';
import 'package:do_cu_di/common/const/string_const.dart';
import 'package:do_cu_di/common/navigation/route_names.dart';
import 'package:do_cu_di/presentation/journey/feature/setting/widget/item_setting.dart';
import 'package:do_cu_di/presentation/routes.dart';
import 'package:do_cu_di/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import '../../../themes/theme_text.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      customAppBar: const CustomAppBar(
        title: StringConst.settings,
        styleTitle: AppTextTheme.medium20PxBlack,
      ),
      body: Column(
        children: [
          ItemSetting(
            icon: IconConst.update,
            title: StringConst.updatePersonalInformation,
            onTap: () {
              Routes.instance.navigateTo(RouteName.updateInformationScreen);
            },
          ),
          ItemSetting(
            icon: IconConst.logout,
            title: StringConst.logOut,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
