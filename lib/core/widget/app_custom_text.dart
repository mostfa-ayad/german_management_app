import 'package:flutter/widgets.dart';

class AppCustomText extends StatelessWidget {
  String text;
  double size;
  int lines;
  FontWeight fontWeight;
  AppCustomText({
    super.key,
    required this.text,
    required this.size,
    this.lines = 1,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: fontWeight),
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
