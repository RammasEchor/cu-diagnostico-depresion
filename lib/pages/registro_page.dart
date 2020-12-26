import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diagnostico_depresion/clases/campo_texto.dart';

enum SingingCharacter { femenino, masculino, otro }

class Registro extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegistroState();
  }
}
class RegistroState extends State<Registro>{
  SingingCharacter _sexo = SingingCharacter.femenino;

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
                child: Column(
                  children: [
                    CampoTexto(
                      encabezado: 'Nombre de usuario',
                      oculto: false,
                      icono: Icon(Icons.person_rounded),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 25, bottom: 20),
                          child: Text(
                            'Sexo',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 21,
                            ),
                          ),
                        ),
                        RadioListTile<SingingCharacter>(
                          title: const Text('femenino'),
                          value: SingingCharacter.femenino,
                          groupValue: _sexo,
                          onChanged: (SingingCharacter value) {
                            setState(() {
                              _sexo = value;
                            });
                          },
                        ),
                        RadioListTile<SingingCharacter>(
                          title: const Text('masculino'),
                          value: SingingCharacter.masculino,
                          groupValue: _sexo,
                          onChanged: (SingingCharacter value) {
                            setState(() {
                              _sexo = value;
                            });
                          },
                        ),
                        RadioListTile<SingingCharacter>(
                          title: const Text('otro'),
                          value: SingingCharacter.otro,
                          groupValue: _sexo,
                          onChanged: (SingingCharacter value) {
                            setState(() {
                              _sexo = value;
                            });
                          },
                        ),
                      ],
                    ),
                    //SizedBox(height: 40,),
                    FlatButton(
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
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => Registro2daParte()
                            )
                        );
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
}

class Registro2daParte extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Registro2daParteState();
  }
}
class Registro2daParteState extends State<Registro2daParte>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: new ListView(
        children: [
          Column(
            children: <Widget>[
              Form(
                child: Column(
                  children: [
                    SizedBox(height: 90,),
                    CampoTexto(
                      encabezado: 'Correo electrónico',
                      oculto: false,
                      icono: Icon(Icons.mail_rounded),
                    ),
                    CampoTexto(
                      encabezado: 'Contraseña',
                      oculto: true,
                      icono: Icon(Icons.lock_rounded),
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
                        Navigator.pushReplacementNamed(context, '/');
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
}

