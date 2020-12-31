import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistorialPruebas extends StatefulWidget{

  @override
  HistorialPruebasState createState() => HistorialPruebasState();

}
class HistorialPruebasState extends State<HistorialPruebas>{

  final databaseReference = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context){

    final Map parametros = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child:Column(
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
              child: StreamBuilder(
                stream: databaseReference.collection('pruebas').where('id_usuario', isEqualTo: parametros['idUsuario']).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot ){
                  return new ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index){
                        return WidgetPrueba(
                          fecha: _calculaFecha(snapshot.data.docs[index].data()["fecha"].toDate()),
                          nivel: snapshot.data.docs[index].data()["nivel"],
                          puntos: snapshot.data.docs[index].data()["puntos"],
                          id: snapshot.data.docs[index].id,
                        );
                      }
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  String _calculaFecha(DateTime fecha){
    String formatoFecha;
    formatoFecha = fecha.day.toString() + '/' +
                  fecha.month.toString() + '/' +
                  fecha.year.toString() + ' - ' +
                  fecha.hour.toString() + ':' + fecha.minute.toString();
    return formatoFecha;
  }
}

class WidgetPrueba extends StatelessWidget{
  final String fecha;
  final String nivel;
  final int puntos;
  var id;

  final databaseReference = FirebaseFirestore.instance;
  WidgetPrueba({
    this.fecha,
    this.nivel,
    this.puntos,
    this.id
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                width: MediaQuery.of(context).size.width * 0.80,
                height: 60,
                child: Text(
                  fecha,
                  style: TextStyle(
                    fontSize: 19,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.delete_rounded),
                  onPressed: (){
                    _eliminaPrueba();
                  },
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
                    )
                ),
                width: MediaQuery.of(context).size.width * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Nivel de depresión',
                        style: TextStyle(
                          color: Colors.black,//Theme.of(context).primaryColor,
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
                          color: Colors.black,//Theme.of(context).primaryColor,
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

  void _eliminaPrueba(){
    try {
      databaseReference
          .collection('pruebas')
          .doc(id)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}