import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diagnostico_depresion/pages/resultados_prueba_page.dart';

class IniciarPrueba extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PruebaState();
  }
}

class PruebaState extends State<IniciarPrueba>{
  int _puntos = 0;
  int _noPregunta = 0;
  bool _termina = false;

  List<String> _preguntas =  [
    'Poco interés o placer en hacer las cosas',
    'Sentirse decaído, deprimido o sin esperanza',
    'Dificultad para conciliar el sueño o permanecer dormido, o dormir demasiado',
    'Sentirse cansado o tener poca energía',
    'Falta de apetito o comer en exceso',
    'Sentirse mal consigo mismo, o que se ha decepcionado a sí mismo o a su familia',
    'Dificultad para concentrarse en cosas, como leer o mirar contenido',
    '¿Se mueve o habla tan lentamente que otras personas podrían haberlo notado? O '
        'al contrario; estar tan inquieto que se ha estado moviendo mucho más de lo habitual',
    'Pensamiento de que estaría mejor muerto o lastimarse de alguna manera',
    'Sentirse nervioso, ansioso o al borde',
    'No poder detener o controlar la preocupación',
    'Preocuparse demasiado por cosas diferentes',
    'Tener problema para relajarse',
    'Enfadarse o irritarse facilmente',
    'Sentir miedo como si algo terrible pudiera pasar',
  ];
  List<String> _respuestas = [
    'De ningún modo',
    'Varios días',
    'Más de la mitad de los días',
    'Casi todos los días',
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          Row(
            children: [
              Text(
                'ayuda',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.help_rounded,
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/ayuda');
                },
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 70,
              padding: EdgeInsets.all(10),
              child: Text(
                'Prueba de depresión',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 26
                ),
              ),
            ),
            Container(
              height: 100,
              child: Text(
                'Responda cada una de las siguientes preguntas sobre cómo se ha '
                    'sentido y se ha comportado durante las últimas dos semanas. '
                    '\nSea honesto para obtener el resultado más preciso.',
                //'Tenga en cuenta que los resultados no son un diagnóstico, solo un profesional de la salud puede dar un diagnóstico.\n\n',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            ///Numero de pregunta
            Text(
                (_noPregunta + 1).toString() + '/' + _preguntas.length.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ///Seccion de preguntas y respuestas
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  ///Pregunta
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      _preguntas[_noPregunta],
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ///Botones
                  _BotonRespuesta(0),
                  _BotonRespuesta(1),
                  _BotonRespuesta(2),
                  _BotonRespuesta(3),
                ],
              ),
            ),
            ///Agregamos le boton de 'Resultados'
            SizedBox(height: 50),
            Opacity(
              opacity: _termina ? 1.0 : 0.0,
              child: FlatButton(
                splashColor: Theme.of(context).primaryColor,
                height: 45,
                color: Theme.of(context).accentColor,
                shape: StadiumBorder(),
                child: Text(
                  'Ver resultados',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
                onPressed: _verResultados,
              ),
            ),
          ],
        ),
      ),
    );
  }
  SizedBox _BotonRespuesta(int iRespuesta){
    return SizedBox(
        height: 60,
        width: 250,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: OutlineButton(
            highlightColor: Theme.of(context).primaryColor,
            shape: StadiumBorder(),
            child: Text(_respuestas[iRespuesta]),
            onPressed: (){
              _responde(iRespuesta);
            },
          ),
        ),
    );
  }

  void _responde(int iRespuesta){
    setState(() {
      int n = _preguntas.length - 1;
      if(_noPregunta <  n){
        _noPregunta++;
        _puntos += iRespuesta;
      }else if (_noPregunta == n && !_termina){
        _puntos += iRespuesta;
        //Activa el boton de 'Resultados'
        _termina = true;
      }
    });
  }
  void _verResultados(){
    if(_termina){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => Resultados(_puntos)
          )
      );
    }
  }

}


