import 'package:do_cu_di/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/const/logo_const.dart';
import '../../../../../common/const/string_const.dart';
import '../../../../../common/utils/common_util.dart';
import '../../../../themes/theme_color.dart';
import 'community_number_widget.dart';

class NumberTableWidget extends StatefulWidget {
  const NumberTableWidget({Key? key}) : super(key: key);

  @override
  State<NumberTableWidget> createState() => _NumberTableWidgetState();
}

class _NumberTableWidgetState extends State<NumberTableWidget> {
  @override
  Widget build(BuildContext context) {
    final double widthCommunityItem = 83.w;

    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.03),
              spreadRadius: 6,
              blurRadius: 7)
        ],
      ),
      child: Column(
        children: [
          Text(
            'Những con số ấn tượng',
            style: AppTextTheme.normalBlack,
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommunityNumberWidget(
                width: widthCommunityItem,
                height: widthCommunityItem,
                icon: IconConst.share_dashboard_old,
                color: AppColors.logoPink,
                des: StringConst.newsGift,
                data: '99',
              ),
              CommunityNumberWidget(
                width: widthCommunityItem,
                height: widthCommunityItem,
                icon: IconConst.receiver,
                color: AppColors.logoSkyBlue,
                des: StringConst.receipts,
                data: '99',
              ),
              CommunityNumberWidget(
                width: widthCommunityItem,
                height: widthCommunityItem,
                icon: IconConst.community,
                color: AppColors.primaryColor,
                des: StringConst.liquidation,
                data: '99',
              ),
              CommunityNumberWidget(
                width: widthCommunityItem,
                height: widthCommunityItem,
                icon: IconConst.order,
                color: AppColors.logoYellow,
                des: StringConst.liquidationOrder,
                data: '99',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
