import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Representa la pagina en donde se muestran los centros de ayuda
class Ayuda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10, bottom: 15),
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Theme.of(context).accentColor,
                ))),
                child: Text(
                  'Centros de Ayuda',
                  style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    //boxShadow: [BoxShadow(color: Colors.orange, offset: Offset(5, 5), blurRadius: 1.0, spreadRadius: 1.0)],
                    border: Border.all(color: Theme.of(context).primaryColor)),
                // height: 10,
                //padding: EdgeInsets.all(//5),
                child: Column(
                  children: [
                    CardCentroAyuda(
                      nombre:
                          'Hospital de Psiquiatría Dr. Gustavo León Mojica García',
                      direccion: 'Carr. A La Cantera Km 4.2, CP: 20206',
                      telefono: '01 (449) 9 76 05 87',
                    ),
                    CardCentroAyuda(
                      nombre: 'Hospital Psiquiátrico. Chametla',
                      direccion:
                          'Carr. Al Norte Ejido en Centenario Km 11.5, CP: 23000',
                      telefono: '01 (612) 1 24 62 13',
                    ),
                    CardCentroAyuda(
                      nombre: 'Hospital Psiquiátrico De Campeche',
                      direccion: 'Carr. Campeche Tenabo km 315, CP: 24560',
                      telefono: '01 (981) 1 19 20 03',
                    ),
                    CardCentroAyuda(
                      nombre: 'Hospital Civil Libertad Juárez Psiquiatrico',
                      direccion: 'Ignacio Alatorre #870 Sur, CP: 32000',
                      telefono: '01 (656) 6 12 01 34',
                    ),
                    CardCentroAyuda(
                      nombre: 'Centro Estatal De Salud Mental',
                      direccion:
                          'Martín Enrique y Juan O\'donojú Col. Virreyes. CP: 25220',
                      telefono: '01 (844) 415 07 63',
                    ),
                    CardCentroAyuda(
                      nombre: 'Hospital Psiq. Dr. Juan N. Navarro',
                      direccion:
                          'Av. San Buenaventura #86, Col. Belisario Domínguez, CP: 14080',
                      telefono: '01 (55) 55 73 28 55',
                    ),
                    CardCentroAyuda(
                      nombre: 'Hospital Psiq. Fray Bernardino Alvarez',
                      direccion: 'Niño de Jesus N.2 Col. Talpan, CP: 14000',
                      telefono: '01 (55) 55 73 03 87',
                    ),
                    CardCentroAyuda(
                      nombre:
                          'Hospital Psiq. De Salud Mental Dr. Miguel Vallebueno',
                      direccion:
                          'Av. Fidel Velázquez S/N, Col. 20 de Noviembre, CP: 34237',
                      telefono: '01 (618) 8 14 10 96',
                    ),
                    CardCentroAyuda(
                      nombre: 'Hospital Psiquiátrico Dr. Adolfo M. Nieto',
                      direccion:
                          'Carr. Fed. México Pirámides Tepex, Km 32.5, CP: 55885',
                      telefono: '01 (594) 9 57 00 03',
                    ),
                    CardCentroAyuda(
                      nombre: 'Clínica Psiquiátrica Dr. Everardo Neuman',
                      direccion:
                          'Carr. Matehuala Soledad de Graciano Sánchez, Km 8.5, CP: 78430',
                      telefono: '01 (444) 8 31 20 23',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                //highlightColor: Theme.of(context).primaryColor,
                //focusColor: Theme.of(context).accentColor,
                splashColor: Theme.of(context).primaryColor,
                height: 45,
                color: Theme.of(context).accentColor,
                shape: StadiumBorder(),
                child: Text(
                  'Preguntas frecuentes',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/preguntasFrec');
                },
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

///Widget para representar un centro de ayuda, con sus datos de contacto
class CardCentroAyuda extends StatelessWidget {
  final String nombre;
  final String direccion;
  final String telefono;

  const CardCentroAyuda({
    Key key,
    this.nombre,
    this.direccion,
    this.telefono,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: RichText(
          text: TextSpan(
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              children: [
                WidgetSpan(
                  child: Icon(Icons.apartment_rounded),
                  alignment: PlaceholderAlignment.middle,
                ),
                TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  text: '  ' + nombre + '\n',
                ),
                WidgetSpan(
                  child: Icon(Icons.where_to_vote_rounded),
                  alignment: PlaceholderAlignment.middle,
                ),
                TextSpan(
                  text: '  ' + direccion + '\n',
                ),
                WidgetSpan(
                  child: Icon(Icons.phone),
                  alignment: PlaceholderAlignment.middle,
                ),
                TextSpan(
                  text: '  ' + telefono,
                ),
              ]),
        ),
      ),
    );
  }
}

///Pantalla que contiene las preguntas mas frecuentes sobre la depresion
class PreguntasFrecuentes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preguntas Frecuentes'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: new ListView(
          children: [
            CardPregunta(
              pregunta: '1. ¿Es la depresión una enfermedad mental?',
              respuesta:
                  'Sí. La depresión es un serio, pero tratable, problema '
                  'mental. Es un problema médico, mas no una debilidad personal.',
            ),
            CardPregunta(
              pregunta: '2. ¿Los niños sufren de depresión?',
              respuesta:
                  'Sí. Los niños están sujetos a los mismos factores que causan depresión en los adultos. '
                  'Estos incluyen: Cambios en la salud física, eventos de la vida, herencia, '
                  'disturbios en su entorno y disturbios químicos en el cerebro.',
            ),
            CardPregunta(
              pregunta: '3. ¿La falta de sueño puede causar depresión?',
              respuesta:
                  'No. La falta de sueño por si sola no puede causar depresión, pero si juega un rol. La falta '
                  'de sueño que resulta de otra enfermedad médica o la presencia de problemas personales '
                  'pueden intensificar la depresión.',
            ),
            CardPregunta(
                pregunta:
                    '4. ¿Existen algunas otras alternativas al tradicional tratamiento para la depresión '
                    'que yo pueda tratar?',
                respuesta:
                    'Se ha encontrado que algunass de las siguientes terpias han sido efectivas:\n'
                    'la acupuntura, imagenes guiadas, la '
                    'quiropracia, el yoga, la hipnosis, biofeedback, aromaterapia, la relajación, los remedios '
                    'herbales, masajes y muchos otros. \nSi estás interesado en tratar algunas de estas opciones, '
                    'habla con tu doctor.'),
            CardPregunta(
                pregunta:
                    '5. ¿Cómo se puede determinar si una enfermedad está causando depresión o si la '
                    'depresión está causando una enfermedad?',
                respuesta:
                    'Las enfermedades que pueden llevar a la depresión son usualmente mayores, crónicas y/o '
                    'terminales. Cuando una enfermedad está causando depresión, generalmente es un dolor '
                    'presente a largo plazo o un cambio repentino en el estilo de vida.\n'
                    'Tener depresión también puede causar que una enfermedad dure más tiempo y '
                    'que intensifique sus síntomas.'),
            CardPregunta(
                pregunta:
                    '6. He escuchado muchas advertencies acerca de las interacciones de drogas con '
                    'ciertas medicinas para la depresión. ¿Cuáles son ellas?',
                respuesta:
                    'Las medicinas que se deben evadir cuando se está tomando MAOIs incluyen todos los '
                    'SSRIs (un grupo de antidepresivos que incluyen Prozac y Paxil) y ciertas medicinas para '
                    'el dolor incluyendo Demerol. También hay algunas medicinas para la toz y para la '
                    'presión alta que no deben ser tomadas con MAOIs.\n\n'
                    'Es importante que le digas al doctor que medicinas estás tomando en estos momentos. Asegúrate de discutir las '
                    'limitaciones, interacciones y posibles efectos secundarios de MAOIs.'),
            CardPregunta(
                pregunta:
                    '7. ¿Por qué las mujeres tienen más tendencia a deprimirse?',
                respuesta:
                    'Las mujeres desarrollan depresión el doble de las veces que los hombres. Una razón '
                    'puede ser los cambios variados en los niveles hormonales que las mujeres experimentan.\n'
                    'Por ejemplo, la depresión es comun durante el embarazo y la menopausia, así como '
                    'después de dar a luz , al sufrir un aborto o al tener una histerectomia.'),
          ],
        ),
      ),
    );
  }
}

///Widget que representa una pregunta
class CardPregunta extends StatelessWidget {
  final String pregunta;
  final String respuesta;

  const CardPregunta({
    Key key,
    this.pregunta,
    this.respuesta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).primaryColor,
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              text: pregunta + '\n\n',
              children: [
                TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  text: respuesta,
                )
              ]),
        ),
      ),
    );
  }
}
