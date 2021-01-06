import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'registro_page.dart';

// Este widget es la pantalla principal
class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    // Obtenemos los parametros que nos envían la pantalla de iniciar
    // sesión o la de registro.
    final Map parametros = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      // Escondemos la appbar por medio de color.
        backgroundColor: Colors.white,
        // Sin división.
        elevation: 0.0,
        bottomOpacity: 0.0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      // Mandamos el correo para mostrarlo en en menú
      drawer: Anvorgesa(
        correo: parametros['correo'],
        idUsuario: parametros['_idUsuario'],
      ),
      // Custom paint ayuda a dibujar las lineas punteadas.
      body: CustomPaint(
        // CurvePainter dibuja las lineas punteadas.
        painter: CurvePainter(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconTheme(
            data: IconThemeData(
              color: Theme.of(context).primaryColor,
            ),
            // Stack para poder dibujar encima los íconos.
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titulos de información.
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
                // Ícono de ayuda (teléfono)
                Positioned(
                  // Esta es la posición relativa.
                  top: MediaQuery.of(context).size.height / 10,
                  left: MediaQuery.of(context).size.width / 10,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ayuda');
                    },
                    fillColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 34.0,
                    ),
                  ),
                ),
                // Ícono de información (i)
                Positioned(
                  top: MediaQuery.of(context).size.height / 15,
                  right: MediaQuery.of(context).size.width / 10,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/depresion');
                    },
                    fillColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 56.0,
                    ),
                    padding: EdgeInsets.all(0.0),
                    shape: CircleBorder(),
                  ),
                ),
                // Ícono de iniciar prueba (Puerta)
                Positioned(
                  top: MediaQuery.of(context).size.height / 1.6,
                  right: MediaQuery.of(context).size.width / 6,
                  child: RawMaterialButton(
                    onPressed: () {
                      // Tenemos que mandar el id de usuario para
                      // saber de quien es al guardar la prueba en 
                      // la base de datos.
                      Navigator.pushNamed(
                        context,
                        '/prueba',
                        arguments: {'idUsuario': parametros['idUsuario']},
                      );
                    },
                    fillColor: Theme.of(context).primaryColor,
                    child: Icon(Icons.input_outlined,
                        color: Colors.white, size: 34.0),
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(),
                  ),
                ),
                // Ícono de historial (lista)
                Positioned(
                  top: MediaQuery.of(context).size.height / 1.7,
                  right: MediaQuery.of(context).size.width / 1.6,
                  child: RawMaterialButton(
                    onPressed: () {
                      // Mandamos el id para saber de quien recuperar
                      // las pruebas en la base de datos.
                      Navigator.pushNamed(
                        context,
                        '/historial',
                        arguments: {'idUsuario': parametros['idUsuario']},
                      );
                    },
                    fillColor: Theme.of(context).primaryColor,
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
      ),
    );
  }
}

// Esta clase dibuja las lineas punteadas.
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Colors.orange;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;

    // Línea a ayuda
    var start = Offset(size.width / 3.2, size.height / 2.6);
    var ctr1 = Offset(size.width / 3, size.height / 3);
    var ctr2 = Offset(size.width / 3, size.height / 5);
    var end = Offset(size.width / 4.3, size.height / 6);
    dashedLine(start, ctr1, ctr2, end, canvas, paint);

    // Información
    start = Offset(size.width / 1.4, size.height / 2.3);
    ctr1 = Offset(size.width / 1.3, size.height / 2.5);
    ctr2 = Offset(size.width / 1.2, size.height / 4);
    end = Offset(size.width / 1.4, size.height / 7);
    dashedLine(start, ctr1, ctr2, end, canvas, paint);

    // Iniciar prueba
    start = Offset(size.width / 1.8, size.height / 1.9);
    ctr1 = Offset(size.width / 1.4, size.height / 1.7);
    ctr2 = Offset(size.width / 1.4, size.height / 1.45);
    end = Offset(size.width / 1.5, size.height / 1.2);
    dashedLine(start, ctr1, ctr2, end, canvas, paint);

    // Historial
    start = Offset(size.width / 3.7, size.height / 1.64);
    ctr1 = Offset(size.width / 3.4, size.height / 1.6);
    ctr2 = Offset(size.width / 3.2, size.height / 1.3);
    end = Offset(size.width / 4.7, size.height / 1.3);
    dashedLine(start, ctr1, ctr2, end, canvas, paint);
  }

  // Dibuja curvas de bezier punteadas de acuerdo a varios parámetros.
  // start, ctr1, ctr2 y end son los puntos de la curva bezier.
  void dashedLine(Offset start, Offset ctr1, Offset ctr2, Offset end,
      Canvas canvas, Paint paint) {
    var path = Path();
    path.moveTo(start.dx, start.dy);
    path.cubicTo(ctr1.dx, ctr1.dy, ctr2.dx, ctr2.dy, end.dx, end.dy);

    canvas.drawPath(
      dashPath(
        path,
        dashArray: CircularIntervalList<double>(<double>[10.0, 5.5]),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// Es el menú hamburgesa.
class Anvorgesa extends StatelessWidget {
  final String correo;
  final String idUsuario;

  // Utilizamos el correo para mostrarlo en
  // la parte superior.
  const Anvorgesa({
    Key key,
    this.correo,
    this.idUsuario,
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
                    this.correo,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            color: Theme.of(context).primaryColor,
          ),
          Container(
            child: Column(
              children: [
                // Son las opciones del menú hamburgesa.
                ListTile(
                  title: Text(
                    'Ayuda',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/ayuda');
                  },
                ),
                ListTile(
                  title: Text(
                    'Información',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/depresion');
                  },
                ),
                ListTile(
                  title: Text(
                    'Iniciar Prueba',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/prueba', arguments: {
                      'idUsuario': this.idUsuario,
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    'Historial',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/historial', arguments: {
                      'idUsuario': this.idUsuario,
                    });
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Registro()),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Simplemente es una fila que muestra el correo al
// inicio del menú hamburgesa.
// La separé para que no se extendiera tanto el
// árbol del texto.
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
              color: Theme.of(context).primaryColor,
              fontSize: this.fontSize,
              fontWeight: this.fontWeight),
        ),
      ],
    );
  }
}
