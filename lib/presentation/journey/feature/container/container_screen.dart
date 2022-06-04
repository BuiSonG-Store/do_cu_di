import 'package:do_cu_di/presentation/themes/theme_color.dart';
import 'package:do_cu_di/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../home/home_screen.dart';

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
          Container(color: AppColors.black),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.white,
        color: AppColors.logoSkyBlue,
        buttonBackgroundColor: AppColors.logoSkyBlue,
        height: 50,
        items: [
          SizedBox(
            height: 40,
            child: Column(
              children: const [
                Icon(
                  Icons.home,
                  size: 25,
                  color: AppColors.white,
                ),
                Text('Trang chủ', style: AppTextTheme.style10px)
              ],
            ),
          ),
          Icon(
            Icons.list,
            size: 30,
            color: AppColors.white,
          ),
          Icon(
            Icons.compare_arrows,
            size: 30,
            color: AppColors.white,
          ),
        ],
        onTap: onTapped,
      ),
    );
  }
}
