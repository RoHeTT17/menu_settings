
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser{

  //Ninguna de estas propiedades se usa, solo es para saber como se llaman
  //bool _colorSecundario;
  //int  _genero;
  //String _nombre;


  static final PreferencesUser _instancia = new PreferencesUser._internal();

  factory PreferencesUser(){
    return _instancia;
  }

  PreferencesUser._internal();

  late SharedPreferences _preferences;

  initPreferences() async{
      _preferences = await SharedPreferences.getInstance();
  }


  //GET y SET

  get getGenero{
    return _preferences.getInt('genero') ?? 1;
  }

  set setGenero(int genero){
    _preferences.setInt('genero', genero); 
  }

  /*int get genero{
    return _preferences.getInt('genero') ?? 1;
  }

  set genero(int genero){
    _preferences.setInt('genero', genero); 
  }*/

  get getSecondColor{
    return _preferences.getBool('color') ?? false;
  }

  set setSecondColor(bool color){
    _preferences.setBool('color', color); 
  }

  get getNameUser{
    return _preferences.getString('name') ?? 'RRR';
  }

  set setNameUser(String name){
    _preferences.setString('name', name); 
  }

  get getLastPage{
    return _preferences.getString('page') ?? 'home';
  }

  set setLastPage(String page){
    _preferences.setString('page', page); 
  }



}