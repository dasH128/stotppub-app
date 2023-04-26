import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stotppub/src/core/data/dto/response_data.dart';
import 'package:stotppub/src/core/data/entity/entity.dart';
import 'package:stotppub/src/core/data/entity/perecedero_entity.dart';

final allTransportProvider =
    FutureProvider<List<QueryDocumentSnapshot<Object?>>>((ref) async {
  CollectionReference db =
      FirebaseFirestore.instance.collection("trasnportista");
  try {
    var transports = await db.get();
    return transports.docs;
  } catch (e) {
    print('error ${e.toString()}');
    return [];
  }

  // return transports;
});

final allVehicleProvider =
    FutureProvider<List<QueryDocumentSnapshot<Object?>>>((ref) async {
  CollectionReference db = FirebaseFirestore.instance.collection("vehiculo");
  print('vehiclessss');
  try {
    var vehicles = await db.get();
    print(vehicles);
    return vehicles.docs;
  } catch (e) {
    print('error ${e.toString()}');
    return [];
  }
});

final allPerecederoProvider =
    StateProvider<List<PerecederoEntity>>((ref) => []);

final registerOrderStateNotifierProvider =
    StateNotifierProvider<RegisterOrderFormNotifier, RegisterOrderFormEntity>(
  (ref) => RegisterOrderFormNotifier(RegisterOrderFormEntity(
    ruc: '',
    phone: '',
    idClient: '',
    idDriver: '',
    idVehicle: '',
    address: '',
    date: '',
    state: '',
  )),
);

class RegisterOrderFormNotifier extends StateNotifier<RegisterOrderFormEntity> {
  RegisterOrderFormNotifier(super.state);

  setRuc(String value) {
    final newState = state.copy(ruc: value);
    state = newState;
  }

  setDate(String value) {
    final newState = state.copy(date: value);
    state = newState;
  }

  setPhone(String value) {
    final newState = state.copy(phone: value);
    state = newState;
  }

  setAddress(String value) {
    final newState = state.copy(address: value);
    state = newState;
  }

  setIdClient(String value) {
    final newState = state.copy(idClient: value);
    state = newState;
  }

  setIdDriver(String value) {
    final newState = state.copy(idDriver: value);
    state = newState;
  }

  setIdVehicle(String value) {
    final newState = state.copy(idVehicle: value);
    state = newState;
  }

  setQuantity(String value) {
    final newState = state.copy(quantity: value);
    state = newState;
  }

  setProduct(String value) {
    final newState = state.copy(product: value);
    state = newState;
  }

  Future<ResponseData<String>> addData() async {
    CollectionReference db = FirebaseFirestore.instance.collection('order');

    showData();
    final order = <String, String>{
      'id': '',
      'idDriver': state.idDriver,
      'idVehicle': state.idVehicle,
      'ruc': state.ruc!,
      'phone': state.phone,
      'address': state.address,
      'date': state.date,
      'product': state.product,
      'quantity': state.quantity,
      'state': state.state ?? 'PROCESO',
    };
    try {
      DocumentReference createOrder = await db.add(order);
      String id = createOrder.id;
      db.doc(id).update({'id': id});
      return ResponseData(isOk: true, menssage: 'isOk', data: id);
    } catch (e) {
      return ResponseData(isOk: false, menssage: e.toString(), data: null);
    }
  }

  showData() {
    print(state.idClient);
    print(state.idDriver);
    print(state.idVehicle);
    print(state.quantity);
    print(state.date);
    print(state.address);
    print(state.phone);
    print(state.ruc);
  }
}
