import 'package:flutter/material.dart';
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
  final bool backGrBlue;

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
      this.stretchCenter = true,
      this.backGrBlue = false})
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
    final double widthItem = MediaQuery.of(context).size.width /
        (widget.twoTab ? 2.4 : ((widget.titlesTab?.length ?? 0) + 1));
    return DefaultTabController(
      length: widget.titlesTab?.length ?? 0,
      child: Column(
        children: [
          Container(
            color: widget.backGrBlue
                ? AppColors.logoSkyBlue.withOpacity(0.7)
                : AppColors.white,
            width: double.infinity,
            height: defaultTabBarHeight,
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor:
                  widget.backGrBlue ? AppColors.white : AppColors.grey7,
              controller: widget.tabController,
              labelColor: AppColors.logoSkyBlue,
              physics: widget.neverScroll
                  ? const NeverScrollableScrollPhysics()
                  : null,
              indicatorColor: AppColors.logoSkyBlue,
              indicator: widget.backGrBlue
                  ? const BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)))
                  : null,
              overlayColor: MaterialStateProperty.all(AppColors.logoSkyBlue),
              tabs: widget.titlesTab!.map((value) {
                return widget.stretchCenter
                    ? SizedBox(
                        width: widthItem,
                        child: Center(
                          child: Text(
                            value,
                            maxLines: 1,
                            textScaleFactor: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: widget.titleSize ?? 14.0),
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
                  child: SizedBox(
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
              : SizedBox(
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
