import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistorialPruebas extends StatefulWidget{

  @override
  HistorialPruebasState createState() => HistorialPruebasState();

}
class HistorialPruebasState extends State<HistorialPruebas>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de pruebas'),
      ),
      body: new ListView(
        children: <Widget>[
          WidgetPrueba(
            fecha: '28/12/2020',
            nivel: 'Moderado',
            puntos: 21,
          ),
          WidgetPrueba(
            fecha: '28/12/2020',
            nivel: 'Moderado',
            puntos: 21,
          ),
          WidgetPrueba(
            fecha: '28/12/2020',
            nivel: 'Moderado',
            puntos: 21,
          ),
          WidgetPrueba(
            fecha: '28/12/2020',
            nivel: 'Moderado',
            puntos: 21,
          ),
          WidgetPrueba(
            fecha: '28/12/2020',
            nivel: 'Moderado',
            puntos: 21,
          ),
        ],
      ),
    );
  }
}

class WidgetPrueba extends StatelessWidget{
  final String fecha;
  final String nivel;
  final int puntos;

  WidgetPrueba({
    this.fecha,
    this.nivel,
    this.puntos
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: Text(
                fecha,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(width: 2, color: Colors.grey[200]),
                        )
                    ),
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(
                            'Nivel de depresión',
                            style: TextStyle(
                              color: Colors.black,//Theme.of(context).primaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            nivel,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20, bottom: 15),
                          child: Text(
                            'Puntos',
                            style: TextStyle(
                              color: Colors.black,//Theme.of(context).primaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            puntos.toString(),
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}