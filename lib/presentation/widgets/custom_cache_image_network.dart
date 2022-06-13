
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/const/logo_const.dart';
import '../../common/utils/common_util.dart';
import '../themes/theme_color.dart';
import '../themes/theme_text.dart';

class CustomCacheImageNetwork extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? border;

  // nếu có userName và url Empty thì sẽ hiện thị ảnh chưa 2 chữ cái trong tên
  final String? userName;
  final Widget? placeHolder;

  const CustomCacheImageNetwork({
    Key? key,
    required this.url,
    this.width = 40,
    this.height = 40,
    this.fit,
    this.border,
    this.userName,
    this.placeHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.isNotEmpty && url.contains('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(border ?? 0)),
        child: Column(
          children: [
            // CachedNetworkImage(
            //   imageUrl: url,
            //   fit: fit,
            //   width: width,
            //   height: height,
            //   errorWidget: (_, url, error) => _widgetImagePlaceHolder(),
            //   placeholder: (context, url) => Shimmer.fromColors(
            //     baseColor: AppColors.grey300,
            //     highlightColor: AppColors.grey100,
            //     enabled: true,
            //     child: Container(
            //       width: width,
            //       height: height,
            //       color: AppColors.white,
            //     ),
            //   ),
            // ),
            Image.network(
             url,
              fit: fit,
              width: width,
              height: height,
            ),
          ],
        ),
      );
    }
    if ((userName?.isNotEmpty ?? false)) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: AppColors.grey4, width: 0.5),
        ),
        padding: const EdgeInsets.all(16),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40), color: AppColors.white),
          child: Center(
            child: Text(
              CommonUtil.getTwoCharOfName(userName),
              style: AppTextTheme.title.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      );
    }
    return _widgetImagePlaceHolder();
  }

  Widget _widgetImagePlaceHolder() =>
      placeHolder ??
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: AppColors.grey4),
            ),
            padding: const EdgeInsets.all(16),
            child: Center(
              child: SvgPicture.asset(
                IconConst.imagePlaceHolder,
                width: double.infinity,
                height: double.infinity,
                color: AppColors.grey4,
              ),
            ),
          );
}
