import 'package:flutter/material.dart';
import 'package:user_preferences_app/preferences/preferences.dart';
import 'package:user_preferences_app/widgets/menu.dart';

class SettingsPage extends StatefulWidget {

  static const String routeName = 'settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario = true;
  int _genero = 1;
  String _nombre = 'Pedro';

  late TextEditingController _textController;

  final prefer = new PreferencesUser();  

 @override
  void initState() {
    super.initState();

      _colorSecundario = prefer.getSecondColor;
      _genero          = prefer.getGenero;
      _nombre          = prefer.getNameUser;
      
      prefer.setLastPage = SettingsPage.routeName;

     //Se iniciliza aquí para mandar el el valor por parámetro
     _textController = new TextEditingController(text: _nombre );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        backgroundColor: (prefer.getSecondColor) ? Colors.teal : Colors.indigo,
      ),
      drawer: const MenuWidget(),
      body: ListView(
          children: [
             Container(
              padding: const EdgeInsets.all(5.0),
              child: const Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
            ),
            const Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: const Text('Color secundario'), 
              onChanged: (value){
                setState(() {
                  _colorSecundario = value;
                  prefer.setSecondColor = value;
                });
              }
              ),
              RadioListTile(
                title: const Text('Masculino'),
                value: 1, 
                groupValue: _genero, 
                onChanged: _setSelectedRadio//(value) => _setSelectedRadio(value as int)
                /*{
                  /*setState(() {
                    _genero = genero as int; 
                  });*/           
                }*/
              ),
              RadioListTile(
                title: const Text('Femenino'),
                value: 2, 
                groupValue: _genero, 
                onChanged: (value) => _setSelectedRadio(value as int)/*{
                  //_setSelectedRadio;
                  setState(() {
                    _genero = value as int; 
                  });
                }*/  
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona que esta usando el fon',
                  ),
                  onChanged: (value){
                    prefer.setNameUser = value;
                  },
                ),
              )
          ],
      )
    );
  }

  void _setSelectedRadio(int? value) {

    
    return  setState(() {

      _genero = value ?? 1; 

      prefer.setGenero = _genero; 

    });

    /*return setState(() async {
                   SharedPreferences prefs = await SharedPreferences.getInstance();

                   _genero = entero ?? 1; 

                    prefs.setInt('genero', _genero); 
                });*/
  }
}