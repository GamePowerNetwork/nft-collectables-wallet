import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required this.context,
    required String title,
    required String subTitle,
    double? expandedHeight,
    String? heroId,
    String? backgroundImageUrl,
    Color? color,
    IconData? icon,
  })  : _title = title,
        _subTitle = subTitle,
        _expandedHeight = expandedHeight,
        _backgroundImageUrl = backgroundImageUrl,
        _heroId = heroId,
        _color = color,
        _icon = icon,
        super(key: key);

  final BuildContext context;
  final String _title;
  final String _subTitle;
  final double? _expandedHeight;
  final String? _backgroundImageUrl;
  final String? _heroId;
  final Color? _color;
  final IconData? _icon;

  Color getTextColorFromBackground(Color color) {
    int d = 0;

    // Counting the perceptive luminance - human eye favors green color...
    double luminance =
        (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;

    if (luminance > 0.5)
      d = 0; // bright colors - black font
    else
      d = 255; // dark colors - white font

    return Color.fromARGB(color.alpha, d, d, d);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: _color,
      expandedHeight: _expandedHeight ?? 150.0,
      floating: true,
      pinned: false,
      stretch: true,
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        background: (_backgroundImageUrl != null)
            ? Hero(
                tag: _heroId!,
                child: Image.network(
                  _backgroundImageUrl!,
                  fit: BoxFit.cover,
                ),
              )
            : null,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                  child: Icon(_icon, color: Colors.grey[350],),
                  backgroundColor: getTextColorFromBackground(_color!)
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _subTitle,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: getTextColorFromBackground(_color!),
                  ),
                ),
                Text(
                  _title,
                  style: TextStyle(
                    color: getTextColorFromBackground(_color!),
                  ),
                ),
              ],
            ),
          ],
        ),
        titlePadding: EdgeInsets.only(left: 10, bottom: 20),
        stretchModes: <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.fadeTitle
        ],
      ),
    );
  }
}
