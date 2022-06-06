import 'package:do_cu_di/common/const/app_const.dart';
import 'package:do_cu_di/presentation/journey/feature/home/widget/banner_home.dart';
import 'package:do_cu_di/presentation/journey/feature/home/widget/custom_sliver_appbar.dart';
import 'package:do_cu_di/presentation/journey/feature/home/widget/number_table_widget.dart';
import 'package:do_cu_di/presentation/journey/feature/home/widget/old_home_tabbar.dart';
import 'package:do_cu_di/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/common_util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _controller = ScrollController();
  int _currentTypeTab = CommonConst.TYPE_GET_OLD_THING_ALL;
  void _goToCart() {}
  void _goToSearch() {}
  void _onChangeTypeDisplay(int type) {
    setState(() {
      _currentTypeTab = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      customAppBar: SafeArea(
        child: CustomAppBar(
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
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            BannerHomeWidget(),
            NumberTableWidget(),
            SliverPersistentHeader(
              delegate: CustomSliverAppBarHeaderHome(
                minHeight: 55.0,
                maxHeight: 55.0,
                child: OldHomeTabBar(
                  onChange: _onChangeTypeDisplay,
                  currentIndex: _currentTypeTab,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
