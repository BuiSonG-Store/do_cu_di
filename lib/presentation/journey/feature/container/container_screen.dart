import 'package:do_cu_di/presentation/themes/theme_color.dart';
import 'package:do_cu_di/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../community/comunity_screen.dart';
import '../home/home_screen.dart';
import '../personal/personal_screen.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({Key? key}) : super(key: key);

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  bool hideText = false;
  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeScreen(),
          Container(color: AppColors.red),
          CommunityScreen(),
          PersonalScreen(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.white,
        color: AppColors.logoSkyBlue,
        buttonBackgroundColor: AppColors.logoSkyBlue,
        height: 52,
        items: const [
          ItemTab(
            icons: Icon(
              Icons.home,
              size: 26,
              color: AppColors.white,
            ),
            title: 'Trang chủ',
          ),
          ItemTab(
            icons: Icon(
              Icons.playlist_add,
              size: 26,
              color: AppColors.white,
            ),
            title: 'Đăng tin',
          ),
          ItemTab(
            icons: Icon(
              Icons.language,
              size: 26,
              color: AppColors.white,
            ),
            title: 'Bảng tin',
          ),
          ItemTab(
            icons: Icon(
              Icons.person,
              size: 26,
              color: AppColors.white,
            ),
            title: 'Cá nhân',
          )
        ],
        onTap: onTapped,
      ),
    );
  }
}

class ItemTab extends StatelessWidget {
  final Icon icons;
  final String title;
  const ItemTab({Key? key, required this.icons, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 52,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icons,
          Text(title, style: AppTextTheme.style10px.copyWith(fontSize: 10))
        ],
      ),
    );
  }
}
