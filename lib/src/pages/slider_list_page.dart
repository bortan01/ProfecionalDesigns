import 'package:dis/src/providers/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _MainScroll(),
        Positioned(
          bottom: -10,
          right: 0,
          child: _BotonNewList(),
        ),
      ],
    ));
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appThemes = Provider.of<ThemeChanger>(context);

    return SizedBox(
      height: 100,
      width: size.width * 0.9,
      child: ButtonTheme(
        minWidth: double.infinity,
        height: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: appThemes.darkTheme
                  ? appThemes.currentTheme.colorScheme.secondary
                  : const Color(0xffED6762),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)))),
          child: Text(
            'CREATE NEW LIST',
            style: TextStyle(
                color: appThemes.currentTheme.scaffoldBackgroundColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 3),
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minheight: 170,
                maxheight: 200,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: appTheme.scaffoldBackgroundColor,
                  child: _Titulo(),
                ))),
        SliverList(delegate: SliverChildListDelegate([...items, const SizedBox(height: 100)]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({required this.minheight, required this.maxheight, required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appThemes = Provider.of<ThemeChanger>(context);

    return Column(
      children: <Widget>[
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(
              color: appThemes.darkTheme ? Colors.grey : const Color(0xff532128),
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: appThemes.darkTheme ? Colors.grey : const Color(0xffF7CDD5),
              ),
            ),
            const Text(
              'List',
              style: TextStyle(color: Color(0xffD93A30), fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}


class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    final appThemes = Provider.of<ThemeChanger>(context);

    return Container(
      padding: const EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: !appThemes.darkTheme ? color : Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        titulo,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
