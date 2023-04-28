import 'package:flutter/material.dart';
import 'package:stotppub/src/core/data/entity/entity.dart';

class ProfileInfoVehicleScreen extends StatelessWidget {
  final RegisterVehicleFormEntity? vehicle;
  const ProfileInfoVehicleScreen({super.key, this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
      ),
      body: Container(
        child: Text(vehicle?.propertyCard ?? 'propertyCard'),
      ),
    );
  }
}
