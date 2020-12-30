import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diagnostico_depresion/clases/campo_texto.dart';
import 'package:diagnostico_depresion/pages/registro_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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
  String _idUsuario;

  final formKey = GlobalKey<FormState>();
  final databaseReference = FirebaseFirestore.instance;

  bool _registroValido;
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
      _obtenUsuario().then((value){
        if(value.isEmpty){
          _registroValido = true;
          _guardaUsuario();
          _obtenUsuario().then((value){
            if(value.isNotEmpty){
              _idUsuario = value[0].id.toString();
              Navigator.pushReplacementNamed(context, '/', arguments: _idUsuario);
            }
          });
        }
        else{
          _registroValido = false;
          /*Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Ya existe un usuario con ese correo!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          ));
          setState(() {
          });*/
        }
      });
    }
  }
  Future _obtenUsuario() async{
    QuerySnapshot snapshot = await databaseReference.collection('usuarios')
        .where('correo', isEqualTo: _correo).get();
    List<QueryDocumentSnapshot> documentos = snapshot.docs;

    return documentos;
  }

  void _guardaUsuario() async {
    String sexo;

    if(widget.sexo.index == 0)
      sexo = 'femenino';
    else if(widget.sexo.index == 1)
      sexo = 'masculino';
    else
      sexo = 'otro';

    DocumentReference ref = await databaseReference.collection('usuarios')
        .add({
      'correo': _correo,
      'edad': widget.edad,
      'nombre': widget.usuario,
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
    else
      return null;
  }
}