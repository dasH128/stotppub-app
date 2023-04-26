import 'package:flutter/material.dart';
import 'package:stotppub/src/core/presentacion/widgets/widgets.dart';

class IncidentScreen extends StatelessWidget {
  const IncidentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incidentes'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (_, int index) {
            return ItemIncidentWidget(name: 'Incidente $index');
            
          },
        ),
      ),
    );
  }
}
