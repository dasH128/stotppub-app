import 'package:flutter/material.dart';
import 'package:stotppub/src/core/data/entity/entity.dart';

class ProfileInfoClientScreen extends StatelessWidget {
  final RegisterClientFormEntity? client;
  const ProfileInfoClientScreen({
    super.key,
    this.client,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
      ),
      body: Container(
        child: Text(client?.name ?? 'name'),
      ),
    );
  }
}
