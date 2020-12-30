import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:diagnostico_depresion/pages/depresion_page.dart';
import 'package:diagnostico_depresion/pages/ayuda_page.dart';
import 'package:diagnostico_depresion/pages/registro_page.dart';
import 'package:diagnostico_depresion/pages/iniciar_sesion_page.dart';
import 'package:diagnostico_depresion/pages/iniciar_prueba_page.dart';
import 'package:diagnostico_depresion/pages/historial_pruebas_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
        accentColor: Colors.green,
        primarySwatch: Colors.green,
      ),
      title: 'Diagnostico Depresion',
      initialRoute: '/',
      routes: {
        '/': (context) => Inicio(),
        '/depresion': (context) => Depresion(),
        '/ayuda': (context) => Ayuda(),
        '/preguntasFrec':(context) => PreguntasFrecuentes(),
        '/registro':(context) => Registro(),
        '/login':(context) => InicioSesion(),
        '/prueba': (context) => IniciarPrueba(),
        '/historial':(context) => HistorialPruebas(),
      },
    );
  }
}
class Inicio extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indice'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('Depresion'),
              onPressed: (){
                Navigator.pushNamed(context, '/depresion');
              },
            ),
            FlatButton(
              child: Text('Centros de ayuda'),
              onPressed: (){
                Navigator.pushNamed(context, '/ayuda');
              },
            ),
            FlatButton(
              child: Text('Registro'),
              onPressed: (){
                Navigator.pushNamed(context, '/registro');
              },
            ),
            FlatButton(
              child: Text('Iniciar Prueba'),
              onPressed: (){
                Navigator.pushNamed(context, '/prueba');
              },
            ),
            FlatButton(
              child: Text('Historial'),
              onPressed: (){
                Navigator.pushNamed(context, '/historial');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BaseDatos extends StatefulWidget {
  BaseDatos({Key key}) : super(key: key);
  @override
  BaseDatosState createState() => BaseDatosState();
}

class BaseDatosState extends State<BaseDatos> {
  final tf1 = TextEditingController();
  final tf2 = TextEditingController();
  final databaseReference = FirebaseFirestore.instance;

  @override
  void dispose() {
    tf1.dispose();
    tf2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(10),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(controller: tf1, decoration: InputDecoration(labelText: 'Titulo del libro'),),
            TextField(controller: tf2, decoration: InputDecoration(labelText: 'Descripcion del libro'),),
            Container(
              child: StreamBuilder(
                stream: databaseReference.collection('books').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot ){
                  return SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index){
                            return Container(
                                child: Column(
                                    children: <Widget>[
                                      Text("Titulo: "+ snapshot.data.docs[index].data()["title"] +"\ndescripcion: "+ snapshot.data.docs[index].data()["description"]),
                                      RaisedButton(child: Icon(Icons.delete), onPressed: (){deleteData(snapshot.data.docs[index].id);},)
                                    ]
                                )
                            );
                          }
                      ));

                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed:() {
          createRecord(tf1.text, tf2.text);
          tf1.text="";
          tf2.text="";
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }


  void createRecord(var t, var d) async {
    DocumentReference ref = await databaseReference.collection("books")
        .add({
      'title': t,
      'description': d
    });

  }

  Future getData() async{
    QuerySnapshot snapshot= await databaseReference.collection("books").get();
    return snapshot.docs;
  }

  void updateData() {
    try {
      databaseReference
          .collection('books')
          .doc('1')
          .update({'description': 'Head First Flutter'});
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteData(var id) {
    try {
      databaseReference
          .collection('books')
          .doc(id)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }

}
