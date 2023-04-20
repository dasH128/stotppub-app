import 'package:flutter/material.dart';
import 'package:stotppub/src/core/presentacion/widgets/widgets.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recorrido de envio'),
        ),
        body: Column(
          children: [
            Expanded(
            child: ListView.builder(
                itemCount: 25,
                itemBuilder: (_, i) {
                  return const ItemTimeLineHistoryOrderWidget(
                    date: '21/02/2023',
                    ubication: 'Moyobamba',
                    reference: 'Ingreso',
                  );
                }),
          ),
            const SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('VER REPORTE DE INCIDENCIAS'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}
