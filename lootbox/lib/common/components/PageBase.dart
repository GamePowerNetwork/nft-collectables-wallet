import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/MainAppBar.dart';
import 'package:gamepower_wallet/common/constants/constants.dart';

class PageBase extends StatefulWidget {
  final Widget child;
  final PageBaseOptions pageOptions;

  const PageBase({Key? key, required this.child, required this.pageOptions}) : super(key: key);

  @override
  PageBaseState createState() => PageBaseState();
}

class PageBaseState extends State<PageBase> {
  Widget build(BuildContext context) {
    return Container(
        child: CustomScrollView(slivers: <Widget>[
          MainAppBar(
            context: this.context,
            title: widget.pageOptions.title,
            subTitle: widget.pageOptions.subTitle,
            expandedHeight: widget.pageOptions.headerHeight,
            color: widget.pageOptions.headerColor,
            icon: widget.pageOptions.headerIcon,
            heroId: widget.pageOptions.headerHeroId,
            backgroundImageUrl: widget.pageOptions.headerBackgroundImage,
          ),
          _buildChild(widget.pageOptions.isSliverChild),
        ]),
      );
  }

  Widget _buildChild(bool isSliver) {
    if(isSliver) {
      return widget.child;
    } else {
      return SliverToBoxAdapter(child: widget.child,);
    }
  }
}

class PageBaseOptions {
  String title;
  String subTitle;
  double headerHeight;
  Color headerColor;
  IconData headerIcon;
  String? headerHeroId;
  String? headerBackgroundImage;
  bool isSliverChild;

  PageBaseOptions({
    this.title = '',
    this.subTitle = '',
    this.headerHeight = kDefaultAppBarHeight,
    this.headerColor = kDefaultAppBarColor,
    this.headerIcon = Icons.public_sharp,
    this.isSliverChild = false,
    this.headerHeroId,
    this.headerBackgroundImage,
  });
}