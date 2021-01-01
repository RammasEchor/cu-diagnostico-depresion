import 'package:flutter/material.dart';

BoxDecoration elevatedInfoDec = BoxDecoration(
  boxShadow: kElevationToShadow[1],
  color: Colors.white,
);

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Menu'),
          ),
          ListTile(
            title: Text('Iniciar Sesión'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}

class UltimaPrueba extends StatelessWidget {
  const UltimaPrueba({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: elevatedInfoDec,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Última prueba',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrangeElevatedButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final Color color ;

  const OrangeElevatedButton({
    Key key,
    this.text = 'Boton Naranja',
    this.onPressed,
    this.color = Colors.orange,
  }) : super(key: key);

  @override
  _OrangeElevatedButtonState createState() => _OrangeElevatedButtonState();
}

class _OrangeElevatedButtonState extends State<OrangeElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(this.widget.color),
      ),
      child: Text(
        this.widget.text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class WhiteFlatButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const WhiteFlatButton({
    Key key,
    this.text = 'Botón Blanco',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      child: Text(
        this.text,
        style: TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
