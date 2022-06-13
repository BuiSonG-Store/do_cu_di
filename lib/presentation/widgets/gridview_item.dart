import 'dart:math';

import 'package:do_cu_di/presentation/widgets/share_item_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/const/app_const.dart';
import '../../common/const/logo_const.dart';
import '../../common/const/string_const.dart';
import '../../common/model/old_model.dart';
import '../../common/utils/common_util.dart';
import '../themes/theme_color.dart';
import '../themes/theme_text.dart';
import 'custom_cache_image_network.dart';
import 'custom_gesturedetactor.dart';

class OldGridViewViewItem extends StatelessWidget {
  final List<OldModel> oldModels;
  final bool limitItem;
  final bool ableScroll;
  final ScrollController? controller;
  final Function(OldModel oldModel)? onItemTap;
  final Color backgroundColor;

  const OldGridViewViewItem({
    Key? key,
    this.ableScroll = false,
    this.limitItem = false,
    this.controller,
    this.onItemTap,
    required this.oldModels,
    this.backgroundColor = AppColors.grey3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetItem = 182.w;
    final sizeImage = 142.w;
    if (oldModels.isEmpty) {
      return const SizedBox();
    }
    var _itemHeight = 182.w + 100;
    final heightList = (limitItem
            ? min(CommonUtil.countNumberRowOfGridview(oldModels), 3)
            : CommonUtil.countNumberRowOfGridview(oldModels)) *
        _itemHeight;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: SizedBox(
        width: double.infinity,
        height: heightList,
        child: GridView.builder(
          itemCount: limitItem ? min(oldModels.length, 6) : oldModels.length,
          controller: controller,
          physics: ableScroll
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          padding:
              const EdgeInsets.symmetric(horizontal: CommonConst.paddingHoz16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: CommonUtil.isPhone() ? 2 : 4,
            crossAxisSpacing: 16.0.w,
            mainAxisExtent: _itemHeight,
          ),
          itemBuilder: (context, index) {
            return _OldItemWidget(
              oldModel: oldModels[index],
              widgetItem: widgetItem,
              sizeImage: sizeImage,
              onItemTap: onItemTap,
            );
          },
        ),
      ),
    );
  }
}

class _OldItemWidget extends StatelessWidget {
  final OldModel oldModel;
  final double widgetItem;
  final double sizeImage;
  final Function(OldModel oldModel)? onItemTap;

  const _OldItemWidget({
    Key? key,
    required this.oldModel,
    required this.widgetItem,
    required this.sizeImage,
    required this.onItemTap,
  }) : super(key: key);

  List<Widget> _buildImage() {
    return [
      Container(
        width: sizeImage,
        height: sizeImage,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: CommonConst.colorsGradient),
          borderRadius: BorderRadius.circular(17),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(1.0),
        child: CustomCacheImageNetwork(
          url: oldModel.pathImage,
          width: sizeImage - 2,
          height: sizeImage - 2,
          fit: BoxFit.cover,
          border: 16,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetector(
      onTap: () {
        if (onItemTap != null) {
          onItemTap!(oldModel);
          return;
        }
      },
      child: Container(
        width: widgetItem,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                spreadRadius: 6,
                blurRadius: 7)
          ],
          borderRadius: BorderRadius.circular(17),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
        margin: const EdgeInsets.only(
          bottom: 8,
          top: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: _buildImage()
                  ..addAll([
                    Positioned(
                      top: 0,
                      right: 0,
                      child: _CornerItemProduct(
                        text: oldModel.typeProduct == 3
                            ? StringConst.liquidation
                            : (oldModel.typeProduct == 2
                                ? StringConst.help
                                : StringConst.give),
                        top: false,
                        color: oldModel.typeProduct == 3
                            ? AppColors.colorLiquidation
                            : (oldModel.typeProduct == 2
                                ? AppColors.colorHelp
                                : AppColors.colorGive),
                      ),
                    ),
                  ]),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              oldModel.nameProduct,
              // oldModel.name ?? '',
              maxLines: 1,
              style: AppTextTheme.mediumBlack.copyWith(
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),

            Text(
              oldModel.description,
              style: AppTextTheme.normalNunito.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 11,
                color: AppColors.black,
              ),
              overflow: TextOverflow.clip,
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            const Divider(
              color: AppColors.colorDivider,
              height: 1,
            ),
            Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    const ShareItemIcon(
                      icon: IconConst.car,
                      sizeIcon: 17,
                      padding: 3,
                      fontSize: 9,
                      text: '100 km',
                      color: AppColors.logoYellow,
                    ),
                    const Spacer(),
                    Text(
                      "100.000đ",
                      //FormatUtils.formatCurrencyDoubleToString
                      style: AppTextTheme.normalNunito.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: AppColors.colorPrice,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _CornerItemProduct extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final bool top;
  final Color color;
  final bool disCount;

  _CornerItemProduct(
      {Key? key,
      required this.text,
      this.top = true,
      this.disCount = false,
      this.color = AppColors.primaryColor,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return disCount
        ? Stack(
            children: [
              SvgPicture.asset(
                IconConst.oldBgDiscount,
                width: 62,
                height: 22,
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "text",
                    style: AppTextTheme.smallNunito.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white),
                  ),
                ),
              )
            ],
          )
        : Container(
            height: 22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(top ? 15 : 12),
                bottomLeft: Radius.circular(top ? 12 : 15),
              ),
              color: color,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                text ?? '',
                style: textStyle ??
                    AppTextTheme.normalNunito.copyWith(
                      fontSize: 10,
                      color: AppColors.white,
                    ),
              ),
            ),
          );
  }
}
