import 'dart:io';

import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/boton_gordo.dart';
import '../widgets/headers.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLarge = false;
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 500) {
      isLarge = true;
    }

    final items = <ItemBoton>[
      ItemBoton(
          FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572),
          const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D)),
      ItemBoton(
          FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572),
          const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D)),
      ItemBoton(
          FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572),
          const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              duration: const Duration(milliseconds: 550),
              child: BotonGordo(
                icon: item.icon,
                texto: item.texto,
                color1: item.color1,
                color2: item.color2,
                onPress: () {},
              ),
            ))
        .toList();

    return Scaffold(
      // backgroundColor: Colors.red,

      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: isLarge ? 10 : 10),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  Visibility(
                    visible: !isLarge,
                    child: const SizedBox(height: 220),
                  ),
                  ...itemMap,
                ],
              ),
            ),
          ),
          Visibility(visible: !isLarge, child: const _Encabezado()),
        ],
      ),
    );
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia M??dica',
          subtitulo: 'Haz solicitado',
          color1: Color(0xff536CF6),
          color2: Color(0xff66A9F2),
        ),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15.0),
            child: const FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          left: 30,
          top: 60,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: Colors.white,
              size: 34,
            ),
          ),
        ),
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      icon: FontAwesomeIcons.carBurst,
      texto: 'Motor Accident',
      color1: const Color(0xff6989F5),
      color2: const Color(0xff906EF5),
      onPress: () {},
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Haz Solicitado',
      titulo: 'Asistencia M??dica',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}
