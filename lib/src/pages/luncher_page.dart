import 'package:dis/src/themes/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../routes/route.dart';

class LuncherPage extends StatelessWidget {
  const LuncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños Flutter'),
      ),
      body: const _ListaOpciones(),
      drawer: const _MenuPrincipal(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Padding(
      padding: const EdgeInsets.all(0),
      child: ListView.separated(
        padding: const EdgeInsets.all(0),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
          color: appTheme.colorScheme.secondary,
        ),
        itemCount: pageRoutes.length,
        itemBuilder: (context, index) => ListTile(
          leading: FaIcon(
            pageRoutes[index].icon,
            color: appTheme.colorScheme.secondary,
          ),
          title: Text(pageRoutes[index].titulo),
          trailing: Icon(
            Icons.chevron_right,
            color: appTheme.colorScheme.secondary,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => pageRoutes[index].page,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: appTheme.currentTheme.colorScheme.secondary,
            ),
            child: const SizedBox(
              width: double.infinity,
              child: CircleAvatar(
                child: Text(
                  "BM",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: _ListaOpciones(),
          ),
          ListTile(
            leading: Icon(
              Icons.light_outlined,
              color: appTheme.currentTheme.colorScheme.secondary,
            ),
            title: const Text("Dark Mode"),
            trailing: Switch.adaptive(
              activeColor: appTheme.currentTheme.colorScheme.secondary,
              value: appTheme.darkTheme,
              onChanged: (onChanged) {
                appTheme.darkTheme = onChanged;
              },
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.add_to_home_screen,
              color: appTheme.currentTheme.colorScheme.secondary,
            ),
            title: const Text("Custom Theme"),
            trailing: Switch.adaptive(
              activeColor: appTheme.currentTheme.colorScheme.secondary,
              value: appTheme.customTheme,
              onChanged: (onChanged) {
                appTheme.customTheme = onChanged;
              },
            ),
          ),
        ],
      ),
    );
  }
}
