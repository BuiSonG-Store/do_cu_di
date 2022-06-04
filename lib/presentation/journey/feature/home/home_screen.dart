import 'package:do_cu_di/presentation/journey/feature/home/widget/banner_home.dart';
import 'package:do_cu_di/presentation/journey/feature/home/widget/number_table_widget.dart';
import 'package:do_cu_di/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../common/utils/common_util.dart';
import '../../../themes/theme_color.dart';
import '../../../widgets/custom_image_network.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _controller = ScrollController();

  void _goToCart() {}

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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              BannerHomeWidget(),
              NumberTableWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
