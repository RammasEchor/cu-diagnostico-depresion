//Widget campo de texto
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget{
  final String encabezado;
  final Icon icono;
  final bool oculto;
  final FormFieldSetter<String> onSaved;
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
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
              ),
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