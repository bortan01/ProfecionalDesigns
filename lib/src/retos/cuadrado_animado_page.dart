import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_changer.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isWide = false;

    isWide = (MediaQuery.of(context).size.width > 500);

    return Scaffold(
      appBar: !isWide
          ? AppBar(
              title: const Text('Cuadro Animado'),
            )
          : null,
      body: Center(child: _CuadradoAnimado()),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;

  @override
  void initState() {
    super.initState();
    // inicializar todo

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4500));

    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.bounceOut)));

    moverArriba = Tween(begin: 0.0, end: -100.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.25, 0.5, curve: Curves.bounceOut)));

    moverIzquierda = Tween(begin: 0.0, end: -100.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.5, 0.75, curve: Curves.bounceOut)));

    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(moverDerecha.value + moverIzquierda.value, moverArriba.value + moverAbajo.value),
        child: child,
      ),
      child: _Rectangulo(),
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    final color = appTheme.currentTheme.colorScheme.secondary;

    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: color),
    );
  }
}
