import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IniciarPrueba extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return PruebaState();
  }
}
/**
 * Se muestra cada pregunta y su botón de respuesta, en donde cada vez que se
 * reponde a una pregunta se incrementan el valor de puntos, el incremento es
 * de acuerdo al numero de respuesta, como se muestra a continuacion
 * respuesta 1: se incrementa 0
 * respuesta 2: se incrementa 1
 * respuesta 3: se incrementa 2
 * respuesta 4: se incrementa 3
 */
class PruebaState extends State<IniciarPrueba>{
  ///Variable que indica los puntos que se llevan a lo largo de la prueba
  int _puntos = 0;
  ///Indice de la lista de preguntas
  int _noPregunta = 0;
  ///Nivel que se obtiene al contestar la prueba
  String _nivel;
  ///Variable que nos indica si ya se terminaron de responder las preguntas
  bool _termina = false;
  ///Referencia a la base de datos
  final databaseReference = FirebaseFirestore.instance;

  ///Lista de preguntas
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
  ///Lista de respuestas
  List<String> _respuestas = [
    'De ningún modo',
    'Varios días',
    'Más de la mitad de los días',
    'Casi todos los días',
  ];
  @override
  Widget build(BuildContext context){
    ///Se recuperan los parametros, que en este caso, unicamente se refiere al ID
    ///del usuario que desea realizar la prueba
    final Map parametros  = ModalRoute.of(context).settings.arguments;
    
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
        child: ListView(
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
            ///Agregamos el boton de 'Resultados'
            SizedBox(height: 50),
            ///Este boton podra ejecutar su funcion una vez que la variable
            ///"termina" es true, indicando que se termino la prueba
            ///Se ilumina del color de acento cuando se cumple la condición
            FlatButton(
                splashColor: Theme.of(context).primaryColor,
                height: 45,
                color: _termina ? Theme.of(context).accentColor : Colors.grey,
                shape: StadiumBorder(),
                child: Text(
                  'Ver resultados',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                  ),
                ),
                onPressed: (){
                  if( _termina )  {
                    _verResultados(parametros);
                  }
                }
            ),
          ],
        ),
      ),
    );
  }

  /**
   * Muestra el boton de respuesta, de acuerdo al indice que recibe como parametro,
   * muestra la respuesta, si se presiona entonces se incrementaran los puntos
   */
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

  /**
   * Si el usuario responde, y aun no se termina la prueba entonces se incrementan
   * los puntos segun el indice de la respuesta, es decir, si correponde al indice
   * 2, a los puntos se le suman 2
   */
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

  /**
   * Escribe en la base de datos, la prueba realizada, los campos que se guardan
   * son: los puntos, la fecha, el nivel que anteriormente se calculó y el ID del
   * usuario, para poder relacionar la otra coleccion de "usuarios"
   */
  void _guardaPrueba(Map parametros) async {
    DocumentReference ref = await databaseReference.collection("pruebas")
        .add({
      'fecha': new DateTime.now(),
      'id_usuario': parametros['idUsuario'],
      'puntos': _puntos,
      'nivel': _nivel,
    });
  }

  /**
   * Cuando el boton de ver resultados surge efecto, se calcula el nivel de depresion,
   * y en base al nivel se declara un mensaje informativo segun el nivel, dicho mensaje
   * se manda como parametro a la siguiente pantalla, la cual muestra la grafica
   * de los resultados junto con el mensaje, los puntos y el nivel obtenido.
   */
  void _verResultados(Map parametros){
    String mensaje;

    if(_termina){
      if(_puntos <= 15){
        _nivel = 'Ninguno';
      }else if(_puntos > 15 && _puntos <= 30){
        _nivel = 'Moderado';
      }else{
        _nivel = 'Severo';
      }
      _guardaPrueba(parametros);

      if(_nivel == 'Ninguno'){
        mensaje = 'Buenas noticias. En base a sus puntos obtenidos es poco '
            'probable que padezca depresión.';
      }else if(_nivel == 'Moderado'){
        mensaje = 'Como puede ver en su puntaje, puede estar experimentando '
            'depresión. La buena noticia es que la depresion es tratable y a menudo curable.';
      }else{
        mensaje = 'Probablemente se encuentra en un cuadro de depersión, le recomendamos que '
            'visite a un psiquiatra o medico especializado para que reciba orientación y el tratamiento adecuado.';
      }

      Navigator.pushReplacementNamed(context, '/resultados',
          arguments: {'puntos': _puntos, 'nivel': _nivel, 'mensaje': mensaje});
    }
  }
}


