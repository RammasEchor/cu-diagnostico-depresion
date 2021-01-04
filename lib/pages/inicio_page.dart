import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
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
          color: Theme.of(context).primaryColor,
        ),
      ),
      // Mandamos el correo para mostrarlo en en menú
      drawer: Anvorgesa( correo: parametros['correo']),
      body: CustomPaint(
        painter: CurvePainter(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconTheme(
            data: IconThemeData(
              color: Theme.of(context).primaryColor,
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
                    fillColor: Theme.of(context).primaryColor,
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

class Anvorgesa extends StatelessWidget {
  final String correo;

  const Anvorgesa({
    Key key,
    this.correo,
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
                      fontSize: 34.0,
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
                ListTile(
                  title: Text(
                    'Login',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Registro',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Prueba',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
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
              color: Theme.of(context).primaryColor,
              fontSize: this.fontSize,
              fontWeight: this.fontWeight),
        ),
      ],
    );
  }
}
