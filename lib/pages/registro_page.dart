import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diagnostico_depresion/clases/campo_texto.dart';

enum sexos { femenino, masculino, otro }

// Primera pantalla del registro;
// Toma el nombre, la edad, y el sexo del usuario.
class Registro extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegistroState();
  }
}
class RegistroState extends State<Registro>{
  String _nombre;
  int _edad;
  sexos _sexo = sexos.femenino;

  // Utilizamos formKey para validar los campos.
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Row(
            children: [
              Text(
                'iniciar sesión',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Nos lleva a la pantall de login.
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
      body: new ListView(
        children: [
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 90,
                padding: EdgeInsets.only(top: 20),
                //alignment: Alignment.center,
                child: Text(
                  'Crear Cuenta',
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
                      encabezado: 'Nombre',
                      oculto: false,
                      icono: Icon(Icons.person_rounded),
                      // formKey.save()
                      onSaved: (input) => _nombre = input,
                      // formKey.validate()
                      validator: (input) => input.isEmpty ? "*Campo obligatorio" : null,
                    ),
                    // Campo de la edad.
                    Container(
                      height: 160,
                      width: 160,
                      padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
                      //padding: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10, bottom: 20),
                            child: Text(
                              'Edad',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 21,
                              ),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                child: IconTheme(
                                  data: IconThemeData(color: Theme.of(context).primaryColor),
                                  child: Icon(Icons.calendar_today_rounded),
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
                            // Si es entero la edad.
                            onSaved: (input) => _edad = int.parse(input),
                            // Si tiene algún valor. Idealmente solamente se pueden
                            // ingresar enteros.
                            validator: (input) => input.isEmpty ? "*Campo obligatorio" : null,
                          ),
                        ],
                      ),
                    ),
                    // Opción múltiple para seleccionar el sexo.
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 25, bottom: 10),
                          child: Text(
                            'Sexo',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 21,
                            ),
                          ),
                        ),
                        RadioListTile<sexos>(
                          title: const Text('femenino'),
                          value: sexos.femenino,
                          groupValue: _sexo,
                          onChanged: (sexos value) {
                            setState(() {
                              _sexo = value;
                            });
                          },
                        ),
                        RadioListTile<sexos>(
                          title: const Text('masculino'),
                          value: sexos.masculino,
                          groupValue: _sexo,
                          onChanged: (sexos value) {
                            setState(() {
                              _sexo = value;
                            });
                          },
                        ),
                        RadioListTile<sexos>(
                          title: const Text('otro'),
                          value: sexos.otro,
                          groupValue: _sexo,
                          onChanged: (sexos value) {
                            setState(() {
                              _sexo = value;
                            });
                          },
                        ),
                      ],
                    ),
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
                          'Siguiente',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                          ),
                        ),
                        onPressed: (){
                          _registroSegundaParte(context);
                        },
                      ),
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

  // Al presionar el botón verde...
  void _registroSegundaParte(BuildContext context){
    // Escuchamos si la forma de validar cada campo devuelve true.
    if(formKey.currentState.validate()){
      // Guardamos en las variables.
      formKey.currentState.save();
      // Pasamos los parámetros a la siguiente pantalla.
      Navigator.pushReplacementNamed(context, '/registro2page',
          arguments: {'nombre': _nombre, 'edad': _edad, 'sexo': _sexo});
    }
  }
}


