import 'package:do_cu_di/presentation/themes/theme_color.dart';
import 'package:do_cu_di/presentation/themes/theme_text.dart';
import 'package:do_cu_di/presentation/widgets/custom_gesturedetactor.dart';
import 'package:do_cu_di/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../common/const/logo_const.dart';
import '../../../../common/const/string_const.dart';
import '../../../widgets/custom_image_network.dart';
import '../home/widget/tab_view_bottom.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  void _editProfile() {}
  void _onSetting() {}

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarWidget: CustomAppBar(
        backgrColor: AppColors.logoSkyBlue,
        title: 'Cá nhân',
        showIconLeft: false,
        styleTitle:
            AppTextTheme.medium20PxBlack.copyWith(color: AppColors.white),
        widgetRight: IconButton(
          onPressed: _onSetting,
          icon: const Icon(
            Icons.settings,
            color: AppColors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.colorsGradient,
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageNetwork(
                  url:
                      'https://scontent.fhan7-1.fna.fbcdn.net/v/t39.30808-6/279241516_1371990706614395_555615174512448029_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=cAYAukL3iWEAX9vZLFc&_nc_ht=scontent.fhan7-1.fna&oh=00_AT92AxNmSwTf_pN-0XAFAR4E0TRcBafx-ON3EU74YRrbCg&oe=62A24CED',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  userName: 'Bùi Sơn',
                  styleUserName:
                      AppTextTheme.mediumBlack.copyWith(fontSize: 12),
                  border: 45,
                  placeHolder: Image.asset(IconConst.share_activity,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                      color: AppColors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bùi Nguyễn Nam Sơn',
                        style: AppTextTheme.medium,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Địa chỉ : 8 Tôn Thất Thuyết, Mỹ Đình, Cầu Giấy, Hà Nội',
                        style: AppTextTheme.normalWhite,
                      ),
                    ],
                  ),
                ),
                CustomGestureDetector(
                  onTap: _editProfile,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white.withOpacity(0.3)),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: TabViewBottom(
              titleSize: 16.0,
              height: null,
              twoTab: true,
              backGrBlue: true,
              titlesTab: const [
                StringConst.liquidation,
                StringConst.gift,
              ],
              tabs: [
                SingleChildScrollView(
                  child: Text('2'),
                ),
                SingleChildScrollView(
                  child: Text('3'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
