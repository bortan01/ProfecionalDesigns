import 'package:dis/src/providers/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/headers.dart';

class HeadersPage extends StatefulWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  State<HeadersPage> createState() => _HeadersPageState();
}

enum Menu {
  headerCuadrado,
  headerBordesRedondeados,
  headerDiagonal,
  headerTriangular,
  headerPico,
  headerCurvo,
  headerWave,
  iconHeader,
}

class _HeadersPageState extends State<HeadersPage> {
  bool isSelected = false;
  Widget newHeader = Container();
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final color = appTheme.currentTheme.colorScheme.secondary;
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<Menu>(
            // Callback that sets the selected popup menu item.
            onSelected: (Menu item) {
              isSelected = true;
              switch (item) {
                case Menu.headerCuadrado:
                  newHeader = HeaderCuadrado(color: color);
                  break;
                case Menu.headerBordesRedondeados:
                  newHeader = HeaderBordesRedondeados(color: color);
                  break;
                case Menu.headerDiagonal:
                  newHeader = HeaderDiagonal(color: color);
                  break;
                case Menu.headerTriangular:
                  newHeader = HeaderTriangular(color: color);
                  break;
                case Menu.headerPico:
                  newHeader = HeaderPico(color: color);
                  break;
                case Menu.headerCurvo:
                  newHeader = HeaderCurvo(color: color);
                  break;
                case Menu.headerWave:
                  newHeader = HeaderWave(color: color);
                  break;
                case Menu.iconHeader:
                  newHeader = const IconHeader(icon: Icons.house, titulo: 'Header', subtitulo: 'Icon');
                  break;
                default:
              }

              setState(() {});
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.headerCuadrado,
                child: Text('Header cuadrado'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.headerBordesRedondeados,
                child: Text('Header Bordes redondeados'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.headerDiagonal,
                child: Text('Header Diagonal'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.headerTriangular,
                child: Text('Header Triangular'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.headerPico,
                child: Text('Header Pico'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.headerCurvo,
                child: Text('Header Curvo'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.headerWave,
                child: Text('Header Wave'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.iconHeader,
                child: Text('Icon Header'),
              ),
            ],
          ),
        ],
        elevation: 0,
      ),
      body: isSelected
          ? newHeader
          : HeaderCurvo(
              color: color,
            ),
    );
  }
}
