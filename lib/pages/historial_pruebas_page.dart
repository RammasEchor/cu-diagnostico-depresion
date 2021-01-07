import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Esta es la pantalla de historial que muestra todas
// las pruebas hechas.
// Cada prueba tiene una fecha y el resultado.
class HistorialPruebas extends StatefulWidget {
  @override
  HistorialPruebasState createState() => HistorialPruebasState();
}

class HistorialPruebasState extends State<HistorialPruebas> {
  ///Creamos la referencia a la base de datos, para poder relizar las operaciones
  ///necesarias sobre la base de datos
  final databaseReference = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    ///Este arreglo contiene los parametros que recibe, en este caso solo recibe
    ///el ID del usuario que inicio sesión o que creó su cuenta
    final Map parametros = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .10,
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Pruebas realizadas',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 26,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .75,
                  ///Mostramos todas las pruebas que se encuentran en la base de
                  ///datos y que cumplan la condicion de que todas tengan el mismo
                  ///ID de usuario con respecto al que se recibió por parametro
                  child: StreamBuilder(
                    stream: databaseReference
                        .collection('pruebas')
                        .where('id_usuario', isEqualTo: parametros['idUsuario'])
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      // Listamos todas las pruebas y las ponemos
                      // en cards.
                      return new ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return WidgetPrueba(
                            fecha: _calculaFecha(snapshot.data.docs[index]
                                .data()["fecha"]
                                .toDate()),
                            nivel: snapshot.data.docs[index].data()["nivel"],
                            puntos: snapshot.data.docs[index].data()["puntos"],
                            id: snapshot.data.docs[index].id,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /**
   * A partir de la fecha que se almacena en la base de datos, desglozamos sus valores
   * para poder mostrarlos con un fomrato entendible para el usuario
   */
  String _calculaFecha(DateTime fecha) {
    String formatoFecha;
    formatoFecha = fecha.day.toString() +
        '/' +
        fecha.month.toString() +
        '/' +
        fecha.year.toString() +
        ' - ' +
        fecha.hour.toString() +
        ':' +
        fecha.minute.toString();
    return formatoFecha;
  }
}

/**
 * Esta clase representa el diseño de una prueba realizada, la cual muestra
 * la fecha en que se creo, el nivel de depresion y sus puntos que se obtuvieron,
 * y un botón para eliminar dicha prueba.
 * Los valores anteriores a excepcion del boton, se reciben por parametro
 */
class WidgetPrueba extends StatelessWidget {
  final String fecha;
  final String nivel;
  final int puntos;
  var id;

  final databaseReference = FirebaseFirestore.instance;
  WidgetPrueba({this.fecha, this.nivel, this.puntos, this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.height * .10,
                child: Text(
                  fecha,
                  style: TextStyle(
                    fontSize: 19,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.delete_rounded,
                    ),
                    onPressed: () {
                      _eliminaPrueba();
                    },
                  ),
                ),
              )
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 15),
                decoration: BoxDecoration(
                    border: Border(
                  right: BorderSide(width: 2, color: Colors.grey[200]),
                )),
                width: MediaQuery.of(context).size.width * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Nivel de depresión',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40),
                      child: Text(
                        nivel,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Puntos',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        puntos.toString(),
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /**
   * Elimina la prueba que cumpla con el identificador unico que en ese momento
   * se toco con el botón de eliminar.
   */
  void _eliminaPrueba() {
    try {
      databaseReference.collection('pruebas').doc(id).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
