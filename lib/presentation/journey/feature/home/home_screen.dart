import 'package:do_cu_di/presentation/journey/feature/home/widget/banner_home.dart';
import 'package:do_cu_di/presentation/journey/feature/home/widget/tab_view_bottom.dart';
import 'package:do_cu_di/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../common/const/string_const.dart';
import '../../../../common/utils/common_util.dart';

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
          BannerHomeWidget(),
          Expanded(
            child: TabViewBottom(
              titleSize: 14.0,
              height: null,
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
                SingleChildScrollView(
                  child: Text('2'),
                ),
                SingleChildScrollView(
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
