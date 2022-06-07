import 'package:do_cu_di/presentation/journey/feature/community/widget/community_item.dart';
import 'package:do_cu_di/presentation/journey/feature/home/widget/banner_home.dart';
import 'package:do_cu_di/presentation/journey/feature/home/widget/number_table_widget.dart';
import 'package:do_cu_di/presentation/themes/theme_color.dart';
import 'package:do_cu_di/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.grey3,
      customAppBar: const CustomAppBar(
        title: 'Bảng tin cộng đồng',
        showIconLeft: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerHomeWidget(),
            NumberTableWidget(),
            OldCommunityItem(),
            OldCommunityItem(
              background: AppColors.grey3,
            ),
            OldCommunityItem(),
          ],
        ),
      ),
    );
  }
}
