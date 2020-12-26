import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InicioSesion extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return InicioSesionState();
  }
}
class InicioSesionState extends State<InicioSesion>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: new ListView(
        children: <Widget>[
          Text('Iniciar Sesión'),
          TextField(
            decoration: InputDecoration(
              hintText: 'Usuario',
            ),
          )
        ],
      ),
    );
  }
}