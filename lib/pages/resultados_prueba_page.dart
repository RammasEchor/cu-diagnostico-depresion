import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resultados extends StatefulWidget{
  final int puntos;
  final String nivel;

  Resultados({
    this.puntos,
    this.nivel
  });

  @override
  ResultadosState createState() => ResultadosState();

}
class ResultadosState extends State<Resultados>{
  String _mensaje;

  @override
  Widget build(BuildContext context){
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
                    Navigator.pushReplacementNamed(context, '/');
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
                _mensaje,
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
                    widget.nivel + ': ' + widget.puntos.toString() + '\n',
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

  @override void initState() {
    if(widget.nivel == 'Ninguno'){
      _mensaje = 'Buenas noticias. En base a sus puntos obtenidos es poco '
          'probable que padezca depresión.';
    }else if(widget.nivel == 'Moderado'){
      _mensaje = 'Como puede ver en su puntaje, puede estar experimentando '
          'depresión. La buena noticia es que la depresion es tratable y a menudo curable.';
    }else{
      _mensaje = 'Probablemente se encuentra en un cuadro de depersión, le recomendamos que '
          'visite a un psiquiatra o medico especializado para que reciba orientación y el tratamiento adecuado.';
    }
    super.initState();
  }
}