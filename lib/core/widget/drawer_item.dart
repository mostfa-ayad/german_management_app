import 'package:flutter/material.dart';

import 'package:german_management_app/core/widget/app_custom_text.dart';

class AppDrawerItem extends StatelessWidget {
  Widget screen;
  String text;
  AppDrawerItem({
    super.key,
    required this.screen,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ));
      },
      child: Row(children: [
        const Icon(Icons.arrow_right),
        AppCustomText(text: text, size: 20)
      ]),
    );
  }
}
