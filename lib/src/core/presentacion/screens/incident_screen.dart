import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stotppub/src/core/presentacion/widgets/widgets.dart';

class IncidentScreen extends StatelessWidget {
  final Map<String, dynamic>? mapa;
  const IncidentScreen({super.key, this.mapa});

  @override
  Widget build(BuildContext context) {
    print('dash ${mapa.toString()}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Incidentes '),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getIncidents(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          List<Map<String, dynamic>>? datos = snapshot.data;
          if (datos == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            child: ListView.builder(
              itemCount: datos.length,
              itemBuilder: (_, int index) {
                Map<String, dynamic> incident = datos[index];
                return ItemIncidentWidget(name: incident['titulo']);
              },
            ),
          );
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getIncidents() async {
    try {
      CollectionReference db = FirebaseFirestore.instance
          .collection("order")
          .doc(mapa!["idOrden"])
          .collection('incidents');
      QuerySnapshot<Object?> incedents = await db.get();
      List<Map<String, dynamic>> datos = incedents.docs.map((doc) {
        return {
          'titulo': doc.get('titulo'),
          'descripcion': doc.get('descripcion'),
        };
      }).toList();
      return datos;
    } catch (e) {
      return [];
    }
  }
}
