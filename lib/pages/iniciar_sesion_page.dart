import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:diagnostico_depresion/clases/campo_texto.dart';

/**
 *En esta pagina se implementa el inicio de sesion, por lo que se requiere el
 * acceso a la base de datos
 */
class InicioSesion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InicioSesionState();
  }
}
/**
 * Contiene el diseño del log-in
 */
class InicioSesionState extends State<InicioSesion> {
  String _correo;
  String _password;
  String _idUsuario;
  bool _correoExistente;
  ///Definimos esta llave para acceder al formulario y ejecutar los metodo de
  ///save y validate para la verificacion de los campos de texto
  final formKey = GlobalKey<FormState>();
  ///Declaramos la variable que nos permite manipular la base de datos
  final databaseReference = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        ///Creamos un builder para poder enviar el contexto a una funcion, con el
        ///fin de mostrar un SnackBar indicando que la contraseña fue incorrecta
        body: Builder(builder: (context) {
          return new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Inicia sesión',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Form(
                    ///Inicializamos la llave de acceso al formulario
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CampoTexto(
                          encabezado: 'Correo electrónico',
                          oculto: false,
                          icono: Icon(Icons.mail_rounded),
                          ///Guardamos el valor actual del campo de texto, y lo
                          ///almacenamos en la variable _correo
                          onSaved: (input) => _correo = input,
                          ///Se ejecuta una validacion especial para el correo
                          validator: _validaCorreo,
                        ),
                        CampoTexto(
                          encabezado: 'Contraseña',
                          oculto: true,
                          icono: Icon(Icons.lock_rounded),
                          onSaved: (input) => _password = input,
                          ///Verificamos que no se deje el campo vacio
                          validator: (input) =>
                              input.isEmpty ? "*Campo obligatorio" : null,
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        ///Boton que hace que se inicie sesion
                        Container(
                          padding: EdgeInsets.only(top: 40),
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: FlatButton(
                            splashColor: Theme.of(context).primaryColor,
                            height: 45,
                            minWidth: MediaQuery.of(context).size.width * .80,
                            color: Theme.of(context).accentColor,
                            shape: StadiumBorder(),
                            child: Text(
                              'Aceptar',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            onPressed: () {
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
        }));
  }

  /**
   * Se comprueba que los campos sean validos gracias a sus funciones de validacion,
   * depues se guardan esos valores, los cuales verificaremos que coincidan con un
   * usuario registrado.
   */
  void _iniciaSesion(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      ///Recuperamos el usuario que tiene como correo electronico el que se
      ///escribio en su campo
      _obtenUsuario(_correo).then((value) {
        if (value.isNotEmpty) {
          ///Si el correo existe entonces, recuperamos el ID del usuario
          _idUsuario = value[0].id.toString();
          String password;
          ///Obtenemos la contraseña segun el ID
          getPassword().then((value) {
            password = value;
            ///Verificamos que la contraseña sea igual a la del usuario con el
            ///correo electronico dado
            if (_password == password) {
              ///Es igual, por lo tanto, damos acceso a la aplicacion, pasando
              ///como parametro el ID y el correo a la pantalla de inicio
              Navigator.pushNamedAndRemoveUntil(context, '/inicio', (route) => false, arguments: {
                'idUsuario': _idUsuario, 'correo': _correo
              });
            } else {
              ///La contraseña es incorrecta, por lo tanto mostramos un SnackBar
              ///que inidique que la contraseña es incorrecta
              setState(() {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: Text(
                    'Contraseña incorrecta',
                    style: TextStyle(color: Colors.white, fontSize: 18),
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

  /**
   * De acuerdo al ID del usuario, obtenemos su contraseña para poder comprobarla
   */
  Future<String> getPassword() async {
    DocumentReference documentReference =
        databaseReference.collection('usuarios').doc(_idUsuario);
    String password;

    await documentReference.get().then((snapshot) {
      password = snapshot.data()['password'].toString();
    });
    return password;
  }

  /**
   * Recuperamos el documento del usuario el cual, en la coleccion de "usuarios"
   * existe uno con el correo que le llega por parametro
   */
  Future _obtenUsuario(String correo) async {
    QuerySnapshot snapshot = await databaseReference
        .collection('usuarios')
        .where('correo', isEqualTo: correo)
        .get();
    List<QueryDocumentSnapshot> documentos = snapshot.docs;

    return documentos;
  }

  /**
   * Verificamos que el campo del correo no este vacio, y si no lo esta, entonces
   * validamos exista en la coleccion de "usuarios"
   */
  String _validaCorreo(String valor) {
    if (valor.isEmpty)
      return '*Campo obligatorio';
    else {
      _obtenUsuario(valor).then((value) {
        if (value.isNotEmpty)
          _correoExistente = true;
        else
          _correoExistente = false;
      });
      if (_correoExistente == false) {
        print(valor);
        return '*El correo no existe';
      } else {
        return null;
      }
    }
  }
}
