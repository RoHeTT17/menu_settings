import 'package:flutter/material.dart';
import 'package:user_preferences_app/preferences/preferences.dart';
import 'package:user_preferences_app/src/pages/home_page.dart';
import 'package:user_preferences_app/src/pages/settings_page.dart';

void main() async{

 //Cuando queremos ejecutar código en el main y esperar a que se realice ese proceso, se debe colocar
 //esta linea
 WidgetsFlutterBinding.ensureInitialized();
 final pref = new PreferencesUser();
 await pref.initPreferences(); 

 runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final pref = new PreferencesUser();

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: pref.getLastPage,//HomePage.routeName,
      routes: {
          HomePage.routeName : ( BuildContext context ) =>  HomePage(),
          SettingsPage.routeName : ( BuildContext context ) => const SettingsPage(),
      }
    );
 }
}