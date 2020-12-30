import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diagnostico_depresion/clases/campo_texto.dart';
import 'package:diagnostico_depresion/pages/registro_2da_parte_page.dart';

enum sexos { femenino, masculino, otro }

class Registro extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegistroState();
  }
}
class RegistroState extends State<Registro>{
  String _usuario;
  String _edad;
  sexos _sexo = sexos.femenino;

  final formKey = GlobalKey<FormState>();

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
                      encabezado: 'Nombre de usuario',
                      oculto: false,
                      icono: Icon(Icons.person_rounded),
                      onSaved: (input) => _usuario = input,
                      validator: (input) => input.isEmpty ? "*Campo obligatorio" : null,
                    ),
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
                            onSaved: (input) => _edad = input,
                            validator: (input) => input.isEmpty ? "*Campo obligatorio" : null,
                          ),
                        ],
                      ),
                    ),
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

  void _registroSegundaParte(BuildContext context){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print(this._sexo);

      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => Registro2daPage(this._usuario, this._edad, this._sexo)
          )
      );
    }
  }
}


