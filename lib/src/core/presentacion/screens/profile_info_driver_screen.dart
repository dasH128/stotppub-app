import 'package:flutter/material.dart';
import 'package:stotppub/src/core/data/entity/entity.dart';

class ProfileInfoDriverScreen extends StatelessWidget {
  final RegisterTransportFormEntity? driver;
  const ProfileInfoDriverScreen({super.key, this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
      ),
      body: Container(
        child: Text(driver?.name ?? 'name'),
      ),
    );
  }
}
