import 'package:do_cu_di/presentation/journey/feature/home/widget/banner_home.dart';
import 'package:do_cu_di/presentation/journey/feature/home/widget/tab_view_bottom.dart';
import 'package:do_cu_di/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../common/const/string_const.dart';
import '../../../../common/utils/common_util.dart';
import '../../../themes/theme_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _goToCart() {}
  void _goToSearch() {}

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      customAppBar: CustomAppBar(
          title: CommonUtil.textHelloInHome(),
          showIconLeft: false,
          styleTitle: AppTextTheme.medium20PxBlack,
          widgetRight: IconButton(
            onPressed: _goToCart,
            icon: const Icon(Icons.shopping_cart),
          ),
          widgetRightTwo: IconButton(
            onPressed: _goToSearch,
            icon: const Icon(Icons.search),
          )),
      body: Column(
        children: [
          const BannerHomeWidget(),
          Expanded(
            child: TabViewBottom(
              titleSize: 15.0,
              height: null,
              backGrBlue: true,
              neverScroll: true,
              titlesTab: const [
                StringConst.all,
                StringConst.liquidation,
                StringConst.gift,
              ],
              tabs: [
                SingleChildScrollView(
                  child: Column(
                    children: [],
                  ),
                ),
                const SingleChildScrollView(
                  child: Text('2'),
                ),
                const SingleChildScrollView(
                  child: Text('3'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
