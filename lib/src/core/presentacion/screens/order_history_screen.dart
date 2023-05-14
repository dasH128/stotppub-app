import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stotppub/src/core/presentacion/widgets/widgets.dart';

class OrderHistoryScreen extends StatelessWidget {
  final String idOrden;
  const OrderHistoryScreen({super.key, required this.idOrden});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recorrido de envio'),
      ),
      body: FutureBuilder(
        future: getLisHistoryByOrder(idOrden),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, String>>> snapshot) {
          List<Map<String, String>>? datos = snapshot.data;
          print('getLisHistoryByOrder ----------------');
          print(datos);
          print('getLisHistoryByOrder ----------------');
          if (datos == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: datos.length,
                    itemBuilder: (_, i) {
                      Map<String, String> dato = datos[i];
                      return ItemTimeLineHistoryOrderWidget(
                        date: dato['date']!,
                        ubication: dato['lugar']!,
                        reference: dato['time']!,
                      );
                    }),
              ),
              const SizedBox(height: 20),
              Center(
                child: OutlinedButton(
                  onPressed: () async {
                    Map<String, dynamic> mapa = {
                      "idOrden": idOrden,
                    };
                    // context.push('/rutaClient', extra: mapa);
                    context.push('/rutaClient', extra: mapa);
                  },
                  child: const Text('VER UBICACIÓN'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }

  Future<List<Map<String, String>>> getLisHistoryByOrder(String idOrden) async {
    CollectionReference db = FirebaseFirestore.instance
        .collection("order")
        .doc(idOrden)
        .collection('historial');

    try {
      // final storage = LocalStorage('my_data.json');
      // String idClient = await storage.getItem('idUser');

      QuerySnapshot<Object?> historiales = await db.get();

      var datos = historiales.docs;
      if (datos.isEmpty) {
        return [];
      }
      List<Map<String, String>> resultadoFinal = datos.map((doc) {
        Timestamp t = doc['time'] as Timestamp;
        var lugar = doc['lugar'] as String;
        return {
          'date': '${t.toDate().day}/${t.toDate().month}/${t.toDate().year}',
          'lugar': lugar,
          'time': '${t.toDate().hour}:${t.toDate().minute}',
        };
      }).toList();

      return resultadoFinal;
    } catch (e) {
      print('error ${e.toString()}');
      return [];
    }
    // List<Map<String, String>> datos = [
    //   {
    //     'date': '21/02/223',
    //     'lugar': 'Monterrico, Distrito de Lima',
    //     'time': '11:47 AM',
    //   },
    //   {
    //     'date': '21/02/2023',
    //     'lugar': 'Ctra. Panamericana Nte. 10, Puente Piedra',
    //     'time': '13:21 pm',
    //   },
    //   {
    //     'date': '21/02/2023',
    //     'lugar': 'Ctra. Panamericana Nte., 15135',
    //     'time': '15:02 pm',
    //   },
    //   {
    //     'date': '21/02/2023',
    //     'lugar': 'Ctra. Panamericana Nte., 02650',
    //     'time': '16:48 pm',
    //   },
    //   {
    //     'date': '21/02/2023',
    //     'lugar': 'Ctra. Panamericana Nte., 02660',
    //     'time': '18:37 pm',
    //   },
    // ];
    // return datos;
  }
}
