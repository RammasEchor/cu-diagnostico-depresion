import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegistroState();
  }
}
class RegistroState extends State<Registro>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Row(
            children: [
              Text(
                'iniciar sesion',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.login,
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //Titulo
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]
                )
              ),
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.center,
              child: Text(
                'Crear Cuenta',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}