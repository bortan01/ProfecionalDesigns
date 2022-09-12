import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/emergency_page.dart';
import '../pages/graficas_circulares_page.dart';
import '../pages/headers_page.dart';
import '../pages/pinterest_page.dart';
import '../pages/slider_list_page.dart';
import '../pages/slideshow_page.dart';
import '../retos/cuadrado_animado_page.dart';

final pageRoutes = <_Route>[

  _Route( FontAwesomeIcons.slideshare , 'Slideshow',  const SlideshowPage() ),
  _Route( FontAwesomeIcons.truckMedical , 'Emergencia',  const EmergencyPage() ),
  _Route( FontAwesomeIcons.heading , 'Encabezados',  const HeadersPage() ),
  _Route( FontAwesomeIcons.peopleCarryBox , 'Cuadro Animado', const CuadradoAnimadoPage() ),
  _Route( FontAwesomeIcons.circleNotch , 'Barra Progreso', const GraficasCircularesPage() ),
  _Route( FontAwesomeIcons.pinterest , 'Pinterest', const PinterestPage() ),
  _Route( FontAwesomeIcons.mobile , 'Slivers', const SliverListPage() ),

];





class _Route {

  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);

}
