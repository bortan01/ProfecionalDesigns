import 'package:dis/src/themes/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
        body: HeaderWave(
      color: appTheme.currentTheme.colorScheme.secondary,
    ));
  }
}
