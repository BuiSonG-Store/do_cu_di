import 'package:do_cu_di/presentation/widgets/custom_gesturedetactor.dart';
import 'package:flutter/material.dart';

import '../../../../../common/const/logo_const.dart';
import '../../../../themes/theme_color.dart';
import '../../../../themes/theme_text.dart';
import '../../../../widgets/custom_image_network.dart';

class OldCommunityItem extends StatelessWidget {
  final Color? background;

  const OldCommunityItem({Key? key, this.background}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(color: background ?? Colors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageNetwork(
              url:
                  'https://scontent.fhan7-1.fna.fbcdn.net/v/t39.30808-6/279241516_1371990706614395_555615174512448029_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=cAYAukL3iWEAX9vZLFc&_nc_ht=scontent.fhan7-1.fna&oh=00_AT92AxNmSwTf_pN-0XAFAR4E0TRcBafx-ON3EU74YRrbCg&oe=62A24CED',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              userName: 'Bùi Sơn',
              styleUserName: AppTextTheme.mediumBlack.copyWith(fontSize: 12),
              border: 20,
              placeHolder: Image.asset(
                IconConst.share_activity,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                color: AppColors.logoSkyBlue,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CustomHtmlWidget(
                  //   data: activityModel.content ?? '',
                  //   fontFamily: AppTextTheme.fontNunito,
                  //   background: background,
                  // ),
                  Text(
                    'Nguyễn Hà Thu Minh vừa đăng tin Cần giúp đỡ:  Tôi cần áo ấm cho các bé vùng cao',
                    style: AppTextTheme.smallBlack,
                  ),
                  Text(
                    'Vừa xong',
                    style: AppTextTheme.smallBlack,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
