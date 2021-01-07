import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resultados extends StatefulWidget {
  @override
  ResultadosState createState() => ResultadosState();
}
/**
 * En esta clase se muestran los resultados de la prueba de depresion
 */
class ResultadosState extends State<Resultados> {
  @override
  Widget build(BuildContext context) {
    ///Recibe como parametros: los puntos obtenidos, el nivel de depresion
    ///caluclado y un mensaje a mandera de resumen de los resultados
    final Map parametros = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Titulo de "Tu resultados fueron"
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Tus resultados fueron',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 26,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ///Se muestra el mensaje basandose en el nivel de depresion
                SizedBox(
                  height: 90,
                  child: Text(
                    parametros['mensaje'],
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
                ///Columna o grafica de los rangos de depresion, indicando los
                ///tres niveles que se manejan: ninguno, moderado y severo
                Container(
                  padding: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text(
                        'Se obtuvieron los siguientes puntos de depresion:\n',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ///Se muestran los puntos que se obtuvieron
                      Text(
                        parametros['nivel'] +
                            ': ' +
                            parametros['puntos'].toString() +
                            '\n',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      ///Rango de depresion Severo
                      Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 150,
                        color: Colors.orange[300],
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: Text('45'),
                            ),
                            Text('Severo'),
                          ],
                        ),
                      ),
                      ///Rango de depresion Moderado
                      Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 150,
                        color: Colors.orange[100],
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: Text('30'),
                            ),
                            Text('Moderado'),
                            Container(
                              alignment: Alignment.bottomLeft,
                              height: 64,
                              width: MediaQuery.of(context).size.width,
                              child: Text('15'),
                            ),
                          ],
                        ),
                      ),
                      ///Rango de depresion Ninguno
                      Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 150,
                        color: Colors.orange[50],
                        child: Column(
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Text('Ninguno'),
                            Container(
                              alignment: Alignment.bottomLeft,
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              child: Text('0'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
