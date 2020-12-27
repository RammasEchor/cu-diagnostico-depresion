import 'package:diagnostico_depresion/pages/registro_page.dart';
import 'package:flutter/material.dart';
import 'package:diagnostico_depresion/clases/campo_texto.dart';


class Registro2daPage extends StatefulWidget{
  final String usuario;
  final String edad;
  final sexos sexo;

  Registro2daPage(this.usuario, this.edad, this.sexo);

  @override
  State<StatefulWidget> createState() {
    return Registro2daPageState();
  }
}
class Registro2daPageState extends State<Registro2daPage>{
  String _correo;
  String _password;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: new ListView(
        children: [
          Column(
            children: <Widget>[
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 90,),
                    CampoTexto(
                      encabezado: 'Correo electrónico',
                      oculto: false,
                      icono: Icon(Icons.mail_rounded),
                      onSaved: (input) => _correo = input,
                      validator: validaCorreo,
                    ),
                    CampoTexto(
                      encabezado: 'Contraseña',
                      oculto: true,
                      icono: Icon(Icons.lock_rounded),
                      onSaved: (input) => _password = input,
                      validator: (input) => input.isEmpty ? '*Campo obligatorio' : null,
                    ),
                    SizedBox(height: 200,),
                    FlatButton(
                      //highlightColor: Theme.of(context).primaryColor,
                      //focusColor: Theme.of(context).accentColor,
                      splashColor: Theme.of(context).primaryColor,
                      height: 45,
                      minWidth: MediaQuery.of(context).size.width * .80,
                      color: Theme.of(context).accentColor,
                      shape: StadiumBorder(),
                      child: Text(
                        'Listo',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                      onPressed: (){
                        _guardaDatos(context);
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _guardaDatos(BuildContext context){
    if(formKey.currentState.validate()){
      formKey.currentState.save();

      Navigator.pushReplacementNamed(context, '/');
    }
  }
  String validaCorreo(String valor){
    Pattern pattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
    if (valor.isEmpty) return '*Campo obligatorio';
    if (!regex.hasMatch(valor))
      return '*Ingresa un correo valido';
    else
      return null;
  }
}