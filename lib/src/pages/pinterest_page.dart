import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        // body: PinterestMenu(),
        // body: PinterestGrid(),
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
    final widthPantalla = MediaQuery.of(context).size.width;

    final mostrar = Provider.of<_MenuModel>(context).mostrar;

    return Positioned(
        bottom: 30,
        child: SizedBox(
          width: widthPantalla,
          child: Align(
            child: PinterestMenu(
              mostrar: mostrar,
              // backgroundColor: Colors.red,
              // activeColor: Colors.red,
              // inactiveColor: Colors.blue,
              items: [
                PinterestButton(
                    icon: Icons.pie_chart,
                    onPressed: () {
                      print('Icon pie_chart');
                    }),
                PinterestButton(
                    icon: Icons.search,
                    onPressed: () {
                      print('Icon search');
                    }),
                PinterestButton(
                    icon: Icons.notifications,
                    onPressed: () {
                      print('Icon notifications');
                    }),
                PinterestButton(
                    icon: Icons.supervised_user_circle,
                    onPressed: () {
                      print('Icon supervised_user_circle');
                    }),
              ],
            ),
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
  final List<int> items = List.generate(200, (i) => i);
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
        return Container(color: Colors.red,
        child: _PinterestItem(index),);
      },
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration:
            const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(30))),
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
