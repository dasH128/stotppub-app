import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stotppub/src/core/data/entity/entity.dart';

final registerVehicleStateNotifierProvider = StateNotifierProvider<
    RegisterVehicleFormNotifier, RegisterVehicleFormEntity>(
  (ref) => RegisterVehicleFormNotifier(
    RegisterVehicleFormEntity(
      registrationNumber: '',
      propertyCard: '',
      numberOfAxes: '',
      width: '',
      long: '',
      hasRefrigeration: false,
      hasSure: false,
      hasSoat: false,
    ),
  ),
);

class RegisterVehicleFormNotifier
    extends StateNotifier<RegisterVehicleFormEntity> {
  RegisterVehicleFormNotifier(super.state);

  setWidth(String value) {
    state.width = value;
  }

  setLong(String value) {
    state.long = value;
  }

  setNumberOfAxes(String value) {
    state.numberOfAxes = value;
  }

  setPropertyCard(String value) {
    state.propertyCard = value;
  }

  setRegistrationNumber(String value) {
    state.registrationNumber = value;
  }

  setHasRefrigeration(bool value) {
    state.hasRefrigeration = value;
  }

  setHasSoat(bool value) {
    state.hasSoat = value;
  }

  setHasSure(bool value) {
    final newState = state.copy(hasSure: value);
    state = newState;
    // state.hasSure = value;
  }

  updateData({String? name}) {
    // state.copy(name: name);
  }
}
