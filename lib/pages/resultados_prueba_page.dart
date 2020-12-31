import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resultados extends StatefulWidget{

  @override
  ResultadosState createState() => ResultadosState();
}
class ResultadosState extends State<Resultados>{
  @override
  Widget build(BuildContext context){

    final Map parametros = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //El boton de atras
            Container(
              padding: EdgeInsets.only(top: 25),
              height: 60,
              child: IconButton(
                  alignment: Alignment.centerLeft,
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25,
                  ),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/inicio');
                  }
              ),
            ),
            //Titulo
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
            //Es el resultado
            SizedBox(
              height: 90,
              child: Text(
                parametros['mensaje'],
                style: TextStyle(
                    fontSize: 18
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            //Almacena los rangos de depresion
            Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Se obtuvieron los siguientes puntos de depresion:\n',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    parametros['nivel'] + ': ' + parametros['puntos'].toString() + '\n',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
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
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 150,
                    color: Colors.orange[50],
                    child: Column(
                      children: [
                        SizedBox(height: 70,),
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
      ),
    );
  }
}