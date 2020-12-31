import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:diagnostico_depresion/clases/campo_texto.dart';

class Registro2daPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return Registro2daPageState();
  }
}
class Registro2daPageState extends State<Registro2daPage>{
  String _correo;
  String _password;
  String _idUsuario;
  bool _correoInvalido;

  final formKey = GlobalKey<FormState>();
  final databaseReference = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context){

    final Map parametros = ModalRoute.of(context).settings.arguments;

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
                      validator: _validaCorreo,
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
                        _btnListo(context, parametros);
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

  void _btnListo(BuildContext context, Map parametros){
    if(formKey.currentState.validate()){
      formKey.currentState.save();

      _guardaUsuario(parametros);

      _obtenUsuario(_correo).then((value){
        if(value.isNotEmpty){
          _idUsuario = value[0].id.toString();

          Navigator.pushReplacementNamed(context, '/',
              arguments: {'idUsuario': _idUsuario
                /*, 'nombre': parametros['nombre'].toString()*/});
        }
      });
    }
  }

  Future _obtenUsuario(String correo) async{
    QuerySnapshot snapshot = await databaseReference.collection('usuarios')
        .where('correo', isEqualTo: correo).get();
    List<QueryDocumentSnapshot> documentos = snapshot.docs;

    return documentos;
  }

  void _guardaUsuario(Map parametros) async {
    String sexo;

    if(parametros['sexo'].index == 0)
      sexo = 'femenino';
    else if(parametros['sexo'].index == 1)
      sexo = 'masculino';
    else
      sexo = 'otro';

    DocumentReference ref = await databaseReference.collection('usuarios')
        .add({
      'correo': _correo,
      'edad': parametros['edad'],
      'nombre': parametros['nombre'],
      'password': _password,
      'sexo': sexo,
    });
  }

  String _validaCorreo(String valor){
    Pattern pattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
    if (valor.isEmpty) return '*Campo obligatorio';
    if (!regex.hasMatch(valor))
      return '*Ingresa un correo valido';
    else {
      _obtenUsuario(valor).then((value){
        if(value.isNotEmpty)
          _correoInvalido = true;
        else
          _correoInvalido = false;
      });
      if(_correoInvalido == true){
        return '*Ya existe un usuario con ese correo!';
      }
      else{
        return null;
      }
    }
  }
}


