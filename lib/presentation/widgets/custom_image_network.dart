import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/const/logo_const.dart';
import '../themes/theme_color.dart';

class CustomImageNetwork extends StatelessWidget {
  final String? url;
  final double width;
  final double height;
  final BoxFit? fit;
  final double? border;
  final double? paddingPlaceHolder;
  final String? userName;
  final TextStyle? styleUserName;
  final Decoration? decorationPlaceHolder;
  final Widget? placeHolder;

  const CustomImageNetwork({
    Key? key,
    this.url,
    this.width = 40,
    this.height = 40,
    this.fit,
    this.paddingPlaceHolder,
    this.border,
    this.userName,
    this.decorationPlaceHolder,
    this.styleUserName,
    this.placeHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((url?.isNotEmpty ?? false) && (url?.contains('http') ?? false)) {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(border ?? 0)),
        child: Image.network(
          url ?? '',
          fit: fit,
          width: width,
          height: height,
          errorBuilder: (
            BuildContext? context,
            Object? error,
            StackTrace? stackTrace,
          ) {
            return _widgetImagePlaceHolder();
          },
          loadingBuilder: (
            BuildContext? context,
            Widget? child,
            ImageChunkEvent? loadingProgress,
          ) {
            if (loadingProgress == null) {
              return child ?? const SizedBox();
            }
            return Shimmer.fromColors(
              baseColor: const Color(0xFFE0E0E0),
              highlightColor: const Color(0xFFF5F5F5),
              enabled: true,
              child: Container(
                width: width,
                height: height,
                color: AppColors.white,
              ),
            );
          },
        ),
      );
    }
    return _widgetImagePlaceHolder();
  }

  Widget _widgetImagePlaceHolder() {
    return (placeHolder ??
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: AppColors.grey4),
          ),
          padding: EdgeInsets.all(paddingPlaceHolder ?? 16),
          child: Center(
            child: SvgPicture.asset(
              IconConst.imagePlaceHolder,
              width: double.infinity,
              height: double.infinity,
              color: AppColors.grey4,
            ),
          ),
        ));
  }
}
