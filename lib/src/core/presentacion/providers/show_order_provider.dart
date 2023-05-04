import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localstorage/localstorage.dart';

final allOrdersProcesProvider =
    FutureProvider<List<QueryDocumentSnapshot>>((ref) async {
  CollectionReference db = FirebaseFirestore.instance.collection("order");
  try {
    var orders = await db.where('state', isEqualTo: 'PROCESO').get();
    print(orders);
    return orders.docs;
  } catch (e) {
    print('error ${e.toString()}');
    return [];
  }
});

final allOrdersFinalizedProvider =
    FutureProvider<List<QueryDocumentSnapshot>>((ref) async {
  CollectionReference db = await FirebaseFirestore.instance.collection("order");

  try {
    var orders = await db.where('state', isEqualTo: 'TERMINADO').get();
    print(orders);
    return orders.docs;
  } catch (e) {
    print('error ${e.toString()}');
    return [];
  }
});

final allOrdersProcesByDriverIdProvider =
    FutureProvider<List<QueryDocumentSnapshot>>((ref) async {
  CollectionReference db = FirebaseFirestore.instance.collection("order");
  try {
    final storage = LocalStorage('my_data.json');
    String idDriver = await storage.getItem('idUser');

    var orders = await db
        .where('state', isEqualTo: 'PROCESO')
        .where('idDriver', isEqualTo: idDriver)
        .get();
    print(orders);
    return orders.docs;
  } catch (e) {
    print('error ${e.toString()}');
    return [];
  }
});

final allOrdersFinalizedByDriverIdProvider =
    FutureProvider<List<QueryDocumentSnapshot>>((ref) async {
  CollectionReference db = await FirebaseFirestore.instance.collection("order");

  try {
    final storage = LocalStorage('my_data.json');
    String idDriver = await storage.getItem('idUser');

    var orders = await db
        .where('state', isEqualTo: 'TERMINADO')
        .where('idDriver', isGreaterThan: idDriver)
        .get();
    print(orders);
    return orders.docs;
  } catch (e) {
    print('error ${e.toString()}');
    return [];
  }
});
