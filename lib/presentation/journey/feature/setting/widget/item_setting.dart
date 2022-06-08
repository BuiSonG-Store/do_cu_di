import 'package:do_cu_di/presentation/themes/theme_color.dart';
import 'package:do_cu_di/presentation/themes/theme_text.dart';
import 'package:do_cu_di/presentation/widgets/custom_gesturedetactor.dart';
import 'package:flutter/material.dart';

class ItemSetting extends StatelessWidget {
  final String title;
  final String icon;
  final Function onTap;

  const ItemSetting(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.grey4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 25,
              width: 25,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: AppTextTheme.normalNunito,
              ),
            ),
            const Icon(Icons.navigate_next),
          ],
        ),
      ),
    );
  }
}
