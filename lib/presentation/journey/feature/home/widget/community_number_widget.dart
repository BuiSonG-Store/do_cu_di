import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../themes/theme_color.dart';
import '../../../../themes/theme_text.dart';

class CommunityNumberWidget extends StatefulWidget {
  final double width;
  final double height;
  final String icon;
  final String data;
  final String des;
  final Color color;
  const CommunityNumberWidget(
      {Key? key,
      required this.icon,
      required this.data,
      required this.des,
      required this.color,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  _CommunityNumberWidgetState createState() => _CommunityNumberWidgetState();
}

class _CommunityNumberWidgetState extends State<CommunityNumberWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                    color: const Color(0xff11032E).withOpacity(0.03),
                    spreadRadius: 6,
                    blurRadius: 7)
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Image.asset(
                  widget.icon,
                  width: 48.w,
                  height: 48.w,
                ),
                const SizedBox(height: 4),
                Text(
                  widget.data,
                  style: AppTextTheme.medium.copyWith(
                    color: widget.color,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.des,
                  textAlign: TextAlign.center,
                  style: AppTextTheme.style10pxBlack
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 11),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
