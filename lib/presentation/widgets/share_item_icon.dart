import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes/theme_color.dart';
import '../themes/theme_text.dart';

class ShareItemIcon extends StatelessWidget {
  final String icon;
  final String text;
  final Color color;
  final Color? colorText;
  final double? padding;
  final double scale;
  final double? sizeIcon;
  final double? fontSize;
  final TextStyle? textStyle;

  const ShareItemIcon({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    this.padding,
    this.scale = 1.0,
    this.colorText,
    this.sizeIcon,
    this.fontSize,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: sizeIcon ?? 15,
            height: sizeIcon ?? 15,
            color: color,
          ),
          SizedBox(width: padding ?? 2),
          Text(
            text,
            style: textStyle ??
                AppTextTheme.smallBlack.copyWith(
                  fontSize: fontSize ?? 10,
                  color: colorText ?? AppColors.black,
                  fontWeight: FontWeight.w400
                ),
          )
        ],
      ),
    );
  }
}
