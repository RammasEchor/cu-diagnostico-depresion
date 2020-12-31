import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:diagnostico_depresion/pages/inicio_page.dart';
import 'package:diagnostico_depresion/pages/depresion_page.dart';
import 'package:diagnostico_depresion/pages/ayuda_page.dart';
import 'package:diagnostico_depresion/pages/registro_page.dart';
import 'package:diagnostico_depresion/pages/registro_2da_parte_page.dart';
import 'package:diagnostico_depresion/pages/iniciar_sesion_page.dart';
import 'package:diagnostico_depresion/pages/iniciar_prueba_page.dart';
import 'package:diagnostico_depresion/pages/resultados_prueba_page.dart';
import 'package:diagnostico_depresion/pages/historial_pruebas_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  //String _idUsuario = 'zaY609IJfL5g8SlFSRjr';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
        accentColor: Colors.green,
        primarySwatch: Colors.green,
      ),
      title: 'Diagnostico Depresion',
      initialRoute: '/registro',
      routes: {
        '/': (context) => Inicio(),
        '/depresion': (context) => Depresion(),
        '/ayuda': (context) => Ayuda(),
        '/preguntasFrec':(context) => PreguntasFrecuentes(),
        '/registro':(context) => Registro(),
        '/registro2page':(context) => Registro2daPage(),
        '/login':(context) => InicioSesion(),
        '/prueba': (context) => IniciarPrueba(),
        '/resultados': (context) => Resultados(),
        '/historial':(context) => HistorialPruebas(),
      },
    );
  }
}
