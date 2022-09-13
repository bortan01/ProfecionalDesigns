import 'package:dis/src/themes/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/luncher_page.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeChanger(2),
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
      home: const LuncherPage(),
    );
  }
}
