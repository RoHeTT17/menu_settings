import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/pages/home_page.dart';
import 'package:user_preferences_app/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  
  const MenuWidget({  Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    MaterialColor colorIcon = Colors.blue;
   
    return Drawer(
     child: ListView(
       children: [
         DrawerHeader(
           padding: EdgeInsets.zero,
           child: Container(),
           decoration: const BoxDecoration(
             image: DecorationImage(image: AssetImage('assets/menu-img.jpg'),
             fit: BoxFit.cover
             ),
           ),
         ),
         ListTile(
           leading: Icon(Icons.pages,color: colorIcon,),
           title: const Text('Pages'),
           onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
         ),
         ListTile(
           leading: Icon(Icons.party_mode,color: colorIcon,),
           title: const Text('Party Mode'),
           onTap: (){},
         ),
                  ListTile(
           leading: Icon(Icons.people,color: colorIcon,),
           title: const Text('People'),
           onTap: (){},
         ),
                  ListTile(
           leading: Icon(Icons.settings,color: colorIcon,),
           title: const Text('Ajustes'),
           onTap: (){
             //ocultar el menú al mandar a la otra pantalla
             /*Navigator.pop(context);
             Navigator.pushNamed(context, SettingsPage.routeName);*/

            //Cambiar el root (la page de inicio) y así evitar que regrese a la anterior
             Navigator.pushReplacementNamed(context, SettingsPage.routeName);

           },
         ),

       ],
     ), 
    );
  }
}