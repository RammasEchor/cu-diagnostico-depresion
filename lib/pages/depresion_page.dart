import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

///Esta pantalla muestra la informacion de ayuda sobre la depresion, como son:
///sintomas, causas, tipos y tratamiento
class Depresion extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Informacion();
  }
}
class Informacion extends State<Depresion>{
  int _iCausas = 0;
  int _iTipo = 0;
  int _iTratamiento = 0;

  List<RichText> causas = [
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Factores genéticos\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Si en el ámbito familiar se halla la presencia de antecedentes '
                    'de depresión, esto puede aumentar las probabilidades de padecer '
                    'esta enfermedad desde un 25% hasta un 30%\n'
                    'Se han hallado genes relacionados con la predisposición de que '
                    'un individuo sea más o menos susceptible a la depresión.'
            ),
          ],
        )
    ),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Factores fisiológicos\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Se caracterizan por alteraciones endocrinas, como la disminución de un '
                    'neurotransmisor llamado serotonina o presentar diabetes, hipertiroidismo.\n'
                    'Por otro lado, los procesos inflamatorios que afectan al cerebro hacen que aumenten '
                    'las probabilidades de desarrollar depresión clínica.'
            ),
          ],
        )
    ),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Factores personales\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'En el caso de las mujeres, sobre todo durante el embarazo '
                    'y el posparto (DPP), se presentan casos de depresión debido '
                    'a las variaciones hormonales.\nLa edad también es un factor '
                    'determinante. En menores, principalmente '
                    'en el periodo de la pubertad y la adolescencia, asi como '
                    'el periodo comprendido entre los 35 y los 45 años incide la depresión.'
            ),
          ],
        )
    ),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Factores ambientales\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Situaciones negativas, familiares y/o laborales, pueden '
                    'producir estrés y desencadenar en depresión, especialmente '
                    'si la persona tiene un historial de dependencia etílica o '
                    'de consumo de drogas. \nLa escasa relación con otras personas, '
                    'como la dificultad de comunicarse y el aislamiento son '
                    'factores clave para desarrollar un cuadro de depresión.'
            ),
          ],
        )
    ),
  ];
  List<RichText> tipos = [
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Trastorno de adaptación con estado de animo deprimido\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Esta condición se diagnostica cuando una persona se está '
                    'adaptando a una nueva faceta o cambio en su vida que le ha '
                    'causado una gran cantidad de estrés.'
            ),
          ],
        )
    ),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Trastorno afectivo estacional\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Las personas con trastorno afectivo estacional sufren los '
                    'síntomas de un trastorno depresivo mayor solo durante una '
                    'época específica del año, generalmente en invierno. '
                    '\nEsto parece estar relacionado con los días más cortos de '
                    'invierno y la falta de luz solar en muchas partes del país.'
            ),
          ],
        )
    ),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Trastorno depresivo mayor\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Afección cuyo síntoma principal es un estado de ánimo '
                    'depresivo abrumador durante más de dos semanas. \nEl estado de '
                    'ánimo deprimido afecta a todas las facetas de la vida de la '
                    'persona, incluido el trabajo, la vida familiar, las relaciones '
                    'y las amistades.'
            ),
          ],
        )
    ),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Trastorno depresivo persistente\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Los síntomas ocurren durante un período de tiempo mucho más '
                    'prolongado, más de 2 años. Se considera una forma crónica de depresión.'
                    '\nLas personas diagnosticadas con esta afección también pueden '
                    'sufrir episodios ocasionales de trastorno depresivo mayor.'
            ),
          ],
        )
    ),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Trastorno depresivo posparto\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Durante el embarazo, el estrógeno y progesterona, en el '
                    'cuerpo de una mujer aumenta enormemente. \nEn las primeras '
                    '24 horas después del parto, la cantidad de estas hormonas '
                    'desciende rápidamente a los niveles normales.\nLos investigadores creen que el cambio '
                    'rápido en los niveles hormonales puede conducir a la depresión.'
            ),
          ],
        )
    ),
  ];
  List<RichText> tratamiento = [
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Terapia Cognitivo-Conductual (TCC)\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Se enfoca en cambiar los pensamientos y comportamientos '
                    'negativos o distorsionados que perpetúan su depresión. '
                    '\nSu terapeuta lo ayudará a cambiar estos pensamientos con otros '
                    'pensamientos más realistas que apoyen su bienestar y sus metas.'
            ),
          ],
        )
    ),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Terapia Interpersonal (IPT)\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Aborda las relaciones sociales de un individuo y cómo mejorarlas. '
                    'Cuando las relaciones fallan, una persona sufre directamente '
                    'la negatividad y la insalubridad de esa relación. '
                    '\nLa terapia busca que el paciente logre comunicarse de manera efectiva, '
                    'expresar emociones de manera adecuada y ser adecuadamente '
                    'asertivo en situaciones personales y profesionales.'
            ),
          ],
        )
    ),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Terapia de Activación Conductual (BA)\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Se Centra en ayudar a las personas a cambiar su comportamiento, '
                    'lo que ayuda a cambiar su estado de ánimo. \nAprenderá a darse '
                    'cuenta de cuándo comienza a deprimirse y a participar en '
                    'actividades que estén alineadas con sus deseos y valores.'

            ),
          ],
        )
    ),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Terapia de Aceptación y Compromiso (ACT)\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Ayuda a concentrarse en el presente, observe y acepte los '
                    'pensamientos y sentimientos negativos, para que no se atasque,'
                    ' identificar lo que es más significativo e importante para usted.'
            ),
          ],
        )
    ),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Terapia de Resolución de Problemas (PST)\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Ayuda a las personas con depresión a aprender a afrontar '
                    'eficazmente los problemas estresantes de su vida diaria. '
                    'Las personas con depresión pueden ver los problemas como '
                    'amenazas y creer que son incapaces de resolverlos. '
                    '\nSu terapeuta lo ayudará a definir el problema, implementar'
                    ' una estrategia y evaluarla para su solución.'
            ),
          ],
        )
    ),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Psicoterapia Psicodinámica a Corto Plazo (STPP)\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Se centra en las relaciones interpersonales y los '
                    'pensamientos y sentimientos inconscientes. '
                    'El objetivo principal es reducir sus síntomas y el objetivo '
                    'secundario es disminuir su vulnerabilidad a la depresión y '
                    'aumentar su capacidad de recuperación.'
            ),
          ],
        )
    ),
    RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          text: 'Medicamentos\n\n',
          children: <TextSpan>[
            TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                text: 'Su médico elegirá su medicamento basándose en: su experiencia '
                    'previa con el medicamento \n(por ejemplo, sus respuestas y efectos adversos); '
                    'trastornos médicos y psicológicos concurrentes '
                    '\n(por ejemplo, también tiene un trastorno de ansiedad); '
                    'cualquier otro medicamento que esté tomando; preferencia personal y '
                    'los efectos secundarios a corto y largo plazo del medicamento.'
            ),
          ],
        )
    ),
    RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          text: 'Inhibidores selectivos de la recaptación de serotonina (ISRS); '
              'ejemplos son Prozac (fluoxetina), Celexa (citalopram) y Paxil (paroxetina).\n\n'
              'Inhibidores de la recaptación de serotonina y noradrenalina (IRSN); '
              'ejemplos son Effexor (venlafaxina) y Cymbalta (duloxetina).\n\n'
              'Antidepresivos tricíclicos (ATC); ejemplos son Elavil (amitriptilina), '
              'Tofranil (imipramina) y Pamelor (nortriptilina).\n\nInhibidores de '
              'la monoaminooxidasa (IMAO); ejemplos son Nardil (fenelzina) y Parnate (tranilcipromina)'
      ),
    ),
    RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          text: 'Los efectos de los medicamentos generalmente se sentirán dentro '
              'de las 6 a 8 semanas posteriores a la toma de un antidepresivo.\n'
              'No todas las personas se sienten mejor con el primer '
              'medicamento que prueban, y deben probar varios otros medicamentos '
              'para encontrar el mejor para ellos.\n\nHable con su médico acerca '
              'del mejor tratamiento para usted.'
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Depresión'),
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
        child: new ListView(
          children: <Widget>[
            _titulo('Síntomas'),
            Card(
              shadowColor: Theme.of(context).primaryColor,
              elevation: 3.0,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Los síntomas de la depresión se caracterizan por un sentimiento abrumador '
                      'de tristeza, aislamiento y desesperación que dura dos semanas o más a la vez. '
                      '\nUna persona que tiene depresión siente que se ha hundido '
                      'en un agujero oscuro y profundo sin salida, y sin esperanza '
                      'de que las cosas cambien',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            _titulo('Causas'),
            Card(
              shadowColor: Theme.of(context).primaryColor,
              elevation: 3.0,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    CarouselSlider(
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                          //aspectRatio: 2.0,
                          viewportFraction: 1,
                          onPageChanged: (index, reason){
                            setState(() {
                              _iCausas = index;
                            });
                          }
                      ),
                      items: causas.map((item) => Container(
                        child: item,
                        //color: Colors.orange,
                      )).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: causas.map((item) {
                        int index = causas.indexOf(item);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _iCausas == index
                                ? Theme.of(context).primaryColor
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            _titulo('Tipos de depresion'),
            Card(
              shadowColor: Theme.of(context).primaryColor,
              elevation: 3.0,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    CarouselSlider(
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                          //aspectRatio: 2.0,
                          viewportFraction: 1,
                          onPageChanged: (index, reason){
                            setState(() {
                              _iTipo = index;
                            });
                          }
                      ),
                      items: tipos.map((item) => Container(
                        child: item,
                        //color: Colors.orange,
                      )).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: tipos.map((item) {
                        int index = tipos.indexOf(item);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _iTipo == index
                                ? Theme.of(context).primaryColor
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            _titulo('Tratamiento'),
            Card(
              shadowColor: Theme.of(context).primaryColor,
              elevation: 3.0,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    CarouselSlider(
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                          //aspectRatio: 2.0,
                          viewportFraction: 1,
                          onPageChanged: (index, reason){
                            setState(() {
                              _iTratamiento = index;
                            });
                          }
                      ),
                      items: tratamiento.map((item) => Container(
                        child: item,
                        //color: Colors.orange,
                      )).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: tratamiento.map((item) {
                        int index = tratamiento.indexOf(item);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _iTratamiento == index
                                ? Theme.of(context).primaryColor
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _titulo(String texto){
    return Container(
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 22,
          color: Theme.of(context).primaryColor,
        ),
      ),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
            color: Theme.of(context).accentColor,
          ))
      ),
    );
  }
}