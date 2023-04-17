import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stotppub/src/core/data/entity/entity.dart';

// final nameProvider =
//     StateProvider<TextEditingController>((ref) => TextEditingController());

final registerTransportStateNotifierProvider = StateNotifierProvider<
    RegisterTransportFormNotifier, RegisterTransportFormEntity>(
  (ref) => RegisterTransportFormNotifier(
    RegisterTransportFormEntity(
      name: 'name',
      lastName: 'lastName',
      ruc: 'rucc',
      address: 'add',
      number: 'numb',
      licenseNumber: '',
      categoryLicense: '',
      email: 'email@',
      password: '',
    ),
  ),
);

class RegisterTransportFormNotifier
    extends StateNotifier<RegisterTransportFormEntity> {
  RegisterTransportFormNotifier(super.state);

  setName(String value) {
    state.name = value;
  }

  setLastName(String value) {
    state.lastName = value;
  }

  setRuc(String value) {
    state.ruc = value;
  }

  setAddress(String value) {
    state.address = value;
  }

  setNumber(String value) {
    state.number = value;
  }

  setLicenseNumber(String value) {
    state.licenseNumber = value;
  }

  setCategoryLicense(String value) {
    // state.categoryLicense = value;
    final newState = state.copy(categoryLicense: value);
    state = newState;
  }

  setEmail(String value) {
    state.email = value;
  }

  setPassword(String value) {
    state.password = value;
  }

  updateData({String? name}) {
    state.copy(name: name);
  }
}
