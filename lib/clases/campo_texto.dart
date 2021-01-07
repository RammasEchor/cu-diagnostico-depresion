import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Widget que representa un TextFormField que permite al usuario escribir texto
 * como nombre, contraseña o correo electronico, el diseño incluye un titulo como
 * encabezado, un icono para facilitar la distición y variables que permiten
 * el acceso y manipulacion  de la información
 */
class CampoTexto extends StatelessWidget{
  ///Titulo que indica el campo que se rellena
  final String encabezado;
  ///Icono para diferenciar mas rapido los campos de texto
  final Icon icono;
  ///Varible que nos permite ocultar el texto que se escriba en el campo, se usa
  ///especialmente en el campo para la contraseña
  final bool oculto;
  ///Funcion que se ejecuta al momento de guardar los valores que se contienen
  final FormFieldSetter<String> onSaved;
  ///Funcion que valida el contenido en el campo y regresa null si es correcto,
  ///de lo contrario permite devolver una cadena que se mostrara en el campo de texto.
  final FormFieldValidator<String> validator;

  CampoTexto({
    this.encabezado,
    this.icono,
    this.oculto,
    this.onSaved,
    this.validator
  });

  @override
  Widget build(BuildContext context){
    return Container(
      height: 145,
      padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Contenedor del titulo o encabezado
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 20),
            child: Text(
              encabezado,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 21,
              ),
            ),
          ),
          TextFormField(
            obscureText: oculto,
            style: TextStyle(
              fontSize: 20,
            ),
            decoration: InputDecoration(
              prefixIcon: Padding(
                child: IconTheme(
                  data: IconThemeData(color: Theme.of(context).primaryColor),
                  child: icono,
                ),
                padding: EdgeInsets.only(left: 10, right: 10),
              ),
              ///Borde que se muestra cuando se pinta el campo de texto
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
              ),
              ///Borde que se activa cuando se toca el campo de texto
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 3,
                ),
              ),
            ),
            onSaved: onSaved,
            validator: validator,
          ),
        ],
      ),
    );
  }
}