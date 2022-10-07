import 'package:dis/src/providers/theme_changer.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLarge = false;

    isLarge = (MediaQuery.of(context).size.width > 500);

    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        appBar: !isLarge ? AppBar(title: const Text("List")) : null,
        body: Stack(
          children: <Widget>[
            const PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;

    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (widthPantalla > 500) {
      widthPantalla -= 300;
    }

    return Positioned(
        bottom: 30,
        child: SizedBox(
          width: widthPantalla,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PinterestMenu(
                mostrar: mostrar,
                backgroundColor: appTheme.scaffoldBackgroundColor,
                activeColor: appTheme.colorScheme.secondary,
                // inactiveColor: Colors.blue,
                items: [
                  PinterestButton(icon: Icons.pie_chart, onPressed: () {}),
                  PinterestButton(icon: Icons.search, onPressed: () {}),
                  PinterestButton(icon: Icons.notifications, onPressed: () {}),
                  PinterestButton(icon: Icons.supervised_user_circle, onPressed: () {}),
                ],
              ),
            ],
          ),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({Key? key}) : super(key: key);

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(100, (i) => i);
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnterior = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return _PinterestItem(index);
      },
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Container(
        height: 200,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        decoration: BoxDecoration(
            color: theme.currentTheme.colorScheme.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}
