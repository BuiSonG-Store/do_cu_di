import 'package:flutter/material.dart';

import '../../../../../common/const/app_const.dart';
import '../../../../../common/const/string_const.dart';
import '../../../../themes/theme_color.dart';
import '../../../../themes/theme_text.dart';
import '../../../../widgets/custom_gesturedetactor.dart';

class OldHomeTabBar extends StatelessWidget {
  final Function(int index) onChange;
  final int currentIndex;
  final bool mustHaveValue;

  OldHomeTabBar({
    Key? key,
    required this.onChange,
    required this.currentIndex,
    this.mustHaveValue = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.grey3,
      ),
      child: Column(
        children: [
          const Spacer(),
          DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.grey3,
            ),
            child: Row(
              children: [
                _itemMenuGive(),
                currentIndex == CommonConst.TYPE_GET_OLD_THING_ALL
                    ? Container(
                        color: AppColors.white,
                        width: 1,
                        height: 14,
                      )
                    : const SizedBox(width: 12),
                _itemMenuLiquidation(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemMenuGive() {
    int type = CommonConst.TYPE_GET_OLD_THING_GIVE;
    bool selected = currentIndex == type;
    return Expanded(
        child: CustomGestureDetector(
      onTap: () {
        if (selected && mustHaveValue) {
          onChange(0);
          return;
        }
        onChange(type);
      },
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: selected ? AppColors.white : Colors.transparent,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  StringConst.newsGift,
                  style: AppTextTheme.medium.copyWith(
                    color:
                        selected ? AppColors.primaryColor : AppColors.greyNew,
                  ),
                ),
              ),
            ),
            Container(
              width: 90,
              height: 1,
              decoration: BoxDecoration(
                color: selected ? AppColors.primaryColor : Colors.transparent,
              ),
            ),
            const SizedBox(height: 7),
          ],
        ),
      ),
    ));
  }

  Widget _itemMenuLiquidation() {
    int type = CommonConst.TYPE_GET_OLD_THING_LIQUIDATION;
    bool selected = currentIndex == type;
    return Expanded(
        child: CustomGestureDetector(
      onTap: () {
        if (selected) {
          onChange(0);
          return;
        }
        onChange(type);
      },
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
            color: selected ? AppColors.white : Colors.transparent,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
            )),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  StringConst.liquidation,
                  style: AppTextTheme.medium.copyWith(
                    color: selected ? AppColors.colorHelp : AppColors.greyNew,
                  ),
                ),
              ),
            ),
            Container(
              width: 90,
              height: 1,
              decoration: BoxDecoration(
                color: selected ? AppColors.colorHelp : Colors.transparent,
              ),
            ),
            const SizedBox(height: 7),
          ],
        ),
      ),
    ));
  }
}
