import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allOrdersProcesProvider = FutureProvider<List<QueryDocumentSnapshot>>((ref) async {
  CollectionReference db = FirebaseFirestore.instance.collection("order");
  try {
    var orders = await db.get();
    print(orders);
    return orders.docs;
  } catch (e) {
    print('error ${e.toString()}');
    return [];
  }
});

final allOrdersFinalizedProvider = FutureProvider<List<QueryDocumentSnapshot>>((ref) async {
  CollectionReference db = FirebaseFirestore.instance.collection("order");
  try {
    var orders = await db.get();
    print(orders);
    return orders.docs;
  } catch (e) {
    print('error ${e.toString()}');
    return [];
  }
});
