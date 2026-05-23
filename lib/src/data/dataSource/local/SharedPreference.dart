import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {

  //Guardar datos
  Future<void> save(String key,dynamic value)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  //Lectura de datos
  Future<dynamic> read(String key)async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString(key) == null) return null;
    return json.decode(prefs.getString(key)!);
  }

  //Eliminar un objeto de session
  Future<bool> remove(String key)async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  //La funcion para saber si el usuario esta en session
  Future<bool> contains(String key) async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
  
}