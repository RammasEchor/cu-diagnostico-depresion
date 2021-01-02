import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map parametros = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        bottomOpacity: 0.0,
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
      ),
      drawer: Anvorgesa(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IconTheme(
          data: IconThemeData(
            color: Colors.orange,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TituloInicio(
                    text: 'Centros de ayuda',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                  ),
                  TituloInicio(
                    text: 'Acerca de la depresión',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                  ),
                  TituloInicio(
                    text: 'Iniciar prueba',
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                  TituloInicio(
                    text: 'Historial',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Positioned(
                width: MediaQuery.of(context).size.width / 3,
                top: MediaQuery.of(context).size.height / 10,
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ayuda');
                  },
                  fillColor: Colors.orange,
                  child: Icon(Icons.phone, color: Colors.white, size: 34.0),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 15,
                right: MediaQuery.of(context).size.width / 10,
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/depresion');
                  },
                  fillColor: Colors.orange,
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 56.0,
                  ),
                  padding: EdgeInsets.all(0.0),
                  shape: CircleBorder(),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.6,
                right: MediaQuery.of(context).size.width / 6,
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/prueba',
                      arguments: {'idUsuario': parametros['idUsuario']},
                    );
                  },
                  fillColor: Colors.orange,
                  child: Icon(Icons.input_outlined,
                      color: Colors.white, size: 34.0),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.7,
                right: MediaQuery.of(context).size.width / 1.6,
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/historial',
                      arguments: {'idUsuario': parametros['idUsuario']},
                    );
                  },
                  fillColor: Colors.orange,
                  child: Icon(Icons.insert_chart_outlined,
                      color: Colors.white, size: 34.0),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Anvorgesa extends StatelessWidget {
  const Anvorgesa({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            child: DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Menú',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            color: Colors.orange,
          ),
          Container(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Registro',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Prueba',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TituloInicio extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double fontSize;
  final FontWeight fontWeight;

  const TituloInicio({
    Key key,
    this.text,
    this.onPressed,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          this.text,
          style: TextStyle(
              color: Colors.orange,
              fontSize: this.fontSize,
              fontWeight: this.fontWeight),
        ),
      ],
    );
  }
}
