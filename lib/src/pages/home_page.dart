import 'package:flutter/material.dart';
import 'package:user_preferences_app/preferences/preferences.dart';
import 'package:user_preferences_app/widgets/menu.dart';

class HomePage extends StatelessWidget {

  static const String routeName = 'home';

  //En el main se precargaron los datos, gracias a que un singleton.
  final prefs = new PreferencesUser();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  prefs.setLastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferencias del usuario'),
        backgroundColor: (prefs.getSecondColor) ? Colors.teal : Colors.indigo,
      ),
      drawer: const MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text('Color secundario: ${prefs.getSecondColor}'),
          const Divider(),
          Text('Género: ${prefs.getGenero}'),
          const Divider(),
          Text('Nombre usuario:${prefs.getNameUser}'),
          const Divider(),
        ],
      ),
    );
  }
}

