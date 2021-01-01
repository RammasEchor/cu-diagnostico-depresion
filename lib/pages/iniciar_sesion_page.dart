import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diagnostico_depresion/componentes/comp_export.dart';

class InicioSesion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InicioSesionState();
  }
}

class InicioSesionState extends State<InicioSesion> {
  double _width;
  bool _awaitLogin = false;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Test de depresión',
              style: TextStyle(
                color: Colors.orange[400],
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Login',
              style: TextStyle(
                color: Colors.orange[600],
                fontSize: 42.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Usuario',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width / 16),
                    child: OrangeElevatedButton(
                      text: 'Iniciar Sesión',
                      color: _awaitLogin ? Colors.orange[100] : Colors.orange,
                      onPressed: () async {
                        setState(()  {
                          _awaitLogin = true;
                        });
                        bool _log = await login();
                        setState(()  {
                          _awaitLogin = false;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: WhiteFlatButton(
                    text: 'Registro',
                    onPressed: () {
                      Navigator.pushNamed(context, '/registro');
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: const Text(
                    'Saltar >',
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.right,
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
