import 'package:flutter/material.dart';

import 'src/pages/slider_list_page.dart';



// import 'package:disenos/src/pages/emergency_page.dart';
// import 'package:disenos/src/pages/headers_page.dart';
// import 'package:disenos/src/pages/animaciones_page.dart';
// import 'package:disenos/src/retos/cuadrado_animado_page.dart';
// import 'package:disenos/src/pages/graficas_circulares_page.dart';
// import 'package:disenos/src/pages/slideshow_page.dart';
// import 'package:disenos/src/pages/pinterest_page.dart';
 


void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: SliverListPage()
    );
  }
}