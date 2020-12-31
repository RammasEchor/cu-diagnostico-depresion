import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inicio extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final Map parametros = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
           child: Column(
             children: <Widget>[
               /*
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text(
                  'Bienvenid@ ' + parametros['nombre'],
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                  ),
                ),
              ),*/
               RaisedButton(
                 child: Text('Depresion'),
                 onPressed: (){
                   Navigator.pushNamed(context, '/depresion');
                 },
               ),
               RaisedButton(
                 child: Text('Centros de ayuda'),
                 onPressed: (){
                   Navigator.pushNamed(context, '/ayuda');
                 },
               ),/*
              RaisedButton(
                child: Text('Registro'),
                onPressed: (){
                  Navigator.pushNamed(context, '/registro');
                },
              ),*/
               RaisedButton(
                 child: Text('Iniciar Prueba'),
                 onPressed: (){
                   Navigator.pushNamed(context, '/prueba',
                       arguments: {'idUsuario': parametros['idUsuario']});
                 },
               ),
               RaisedButton(
                 child: Text('Historial'),
                 onPressed: (){
                   Navigator.pushNamed(context, '/historial',
                       arguments: {'idUsuario': parametros['idUsuario']});
                 },
               ),
             ],
           ),
         ),
      )
    );
  }
}