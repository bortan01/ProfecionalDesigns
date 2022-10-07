import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../providers/theme_changer.dart';
import '../widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLarge = false;
    bool isWide = false;

    isLarge = (MediaQuery.of(context).size.height > 500);
    isWide = (MediaQuery.of(context).size.width > 500);

    final children = [
      const Expanded(child: MiSlideshow()),
      const Expanded(child: MiSlideshow()),
    ];
    return Scaffold(
      appBar: !isWide
          ? AppBar(
              title: const Text('Slide Show'),
            )
          : null,
      body: isLarge ? Column(children: children) : Row(children: children),
    );
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Slideshow(
      bulletPrimario: 20,
      bulletSecundario: 12,
      // puntosArriba: true,
      colorPrimario: appTheme.darkTheme ? accentColor : const Color(0xffFF5A7E),
      // colorSecundario: Colors.red,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
