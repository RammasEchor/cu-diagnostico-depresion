import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:diagnostico_depresion/clases/campo_texto.dart';

class InicioSesion extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return InicioSesionState();
  }
}
class InicioSesionState extends State<InicioSesion>{
  String _correo;
  String _password;
  String _idUsuario;
  bool _correoExistente;

  final formKey = GlobalKey<FormState>();
  final databaseReference = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Builder(builder: (context){
        return new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  padding: EdgeInsets.only(top: 20),
                  //alignment: Alignment.center,
                  child: Text(
                    'Inicia sesión',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 26
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        validator: (input) => input.isEmpty ? "*Campo obligatorio" : null,
                      ),
                      SizedBox(height: 80,),
                      //Boton Siguiente
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: FlatButton(
                          //highlightColor: Theme.of(context).primaryColor,
                          //focusColor: Theme.of(context).accentColor,
                          splashColor: Theme.of(context).primaryColor,
                          height: 45,
                          minWidth: MediaQuery.of(context).size.width * .80,
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                          child: Text(
                            'Aceptar',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                            ),
                          ),
                          onPressed: (){
                            _iniciaSesion(context);

                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        );
      })
    );
  }

  void _iniciaSesion(BuildContext context){
    if(formKey.currentState.validate()){
      formKey.currentState.save();

      _obtenUsuario(_correo).then((value){
        if(value.isNotEmpty){
          _idUsuario = value[0].id.toString();
          String password;
          getPassword().then((value){
            password = value;
            if(_password == password){
              Navigator.pushReplacementNamed(context, '/inicio',
                  arguments: {'idUsuario': _idUsuario
                    /*, 'nombre': parametros['nombre'].toString()*/});
            }else{
              setState(() {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content:Text(
                    'Contraseña incorrecta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                ));
              });
            }
          });
        }
      });
    }
  }
  Future<String> getPassword() async {
    DocumentReference documentReference = databaseReference
        .collection('usuarios').doc(_idUsuario);
    String password;

    await documentReference.get().then((snapshot) {
      password = snapshot.data()['password'].toString();
    });
    return password;
  }

  Future _obtenUsuario(String correo) async{
    QuerySnapshot snapshot = await databaseReference.collection('usuarios')
        .where('correo', isEqualTo: correo).get();
    List<QueryDocumentSnapshot> documentos = snapshot.docs;

    return documentos;
  }

  String _validaCorreo(String valor){
    if (valor.isEmpty) return '*Campo obligatorio';
    else{
      _obtenUsuario(valor).then((value){
        if(value.isNotEmpty)
          _correoExistente = true;
        else
          _correoExistente = false;
      });
      if(_correoExistente == false){
        print(valor);
        return '*El correo no existe';
      }
      else{
        return null;
      }
    }
  }
}