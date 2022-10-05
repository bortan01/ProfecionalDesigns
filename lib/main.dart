import 'package:dis/src/pages/luncher_tablet_page.dart';
import 'package:dis/src/providers/layout_provider.dart';
import 'package:dis/src/providers/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/luncher_page.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeChanger(1)),
          ChangeNotifierProvider(create: (_) => LayoutProvider()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: appTheme.currentTheme,
      // darkTheme: ,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;
          // tamano tableta
          if (screenSize.width > 500) {
            return const LuncherTabletPage();
          }

          return const LuncherPage();
        },
      ),
    );
  }
}
