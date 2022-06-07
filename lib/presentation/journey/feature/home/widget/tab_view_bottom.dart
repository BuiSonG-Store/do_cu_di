import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../themes/theme_color.dart';

const defaultTabBarHeight = 40.0;

class TabViewBottom extends StatefulWidget {
  final List<String>? titlesTab;
  final double? titleSize;
  final List<Widget>? tabs;
  final double? height;
  final double? widthTitleTab;
  final bool twoTab;
  final bool neverScroll;
  final TabController? tabController;
  final bool stretchCenter;

  TabViewBottom(
      {Key? key,
      this.tabs,
      this.widthTitleTab,
      this.titleSize,
      this.height,
      this.twoTab = false,
      this.tabController,
      this.titlesTab,
      this.neverScroll = false,
      this.stretchCenter = true})
      : super(key: key);

  @override
  _TabViewBottomState createState() => _TabViewBottomState();
}

class _TabViewBottomState extends State<TabViewBottom> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.titlesTab?.length ?? 0,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: defaultTabBarHeight,
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: AppColors.grey7,
              controller: widget.tabController,
              labelColor: AppColors.logoSkyBlue,
              physics: widget.neverScroll
                  ? const NeverScrollableScrollPhysics()
                  : null,
              indicatorColor: AppColors.logoSkyBlue,
              overlayColor: MaterialStateProperty.all(AppColors.logoSkyBlue),
              tabs: widget.titlesTab!.map((value) {
                return widget.stretchCenter
                    ? Container(
                        width: MediaQuery.of(context).size.width /
                            (widget.twoTab
                                ? 2.4
                                : ((widget.titlesTab?.length ?? 0) + 1)),
                        child: Center(
                          child: Text(
                            value,
                            maxLines: 1,
                            textScaleFactor: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: widget.titleSize ?? 12.0),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          value,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: widget.titleSize ?? 12.0),
                        ),
                      );
              }).toList(),
            ),
          ),
          widget.height == null
              ? Expanded(
                  child: Container(
                    width: double.infinity,
                    child: TabBarView(
                      controller: widget.tabController,
                      physics: widget.neverScroll
                          ? const NeverScrollableScrollPhysics()
                          : null,
                      children: widget.tabs ?? [],
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: widget.height,
                  child: TabBarView(
                    controller: widget.tabController,
                    physics: widget.neverScroll
                        ? const NeverScrollableScrollPhysics()
                        : null,
                    children: widget.tabs ?? [],
                  ),
                ),
        ],
      ),
    );
  }
}
