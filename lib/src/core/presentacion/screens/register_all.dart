import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stotppub/src/core/presentacion/widgets/widgets.dart';

class RegisterAllScreen extends StatelessWidget {
  const RegisterAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '¡Que deseas realizar hoy?',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child: Column(
          children: [
            // const Text(
            //   '¡Que deseas realizar hoy?',
            //   style: TextStyle(fontSize: 20),
            // ),
            const SizedBox(height: 15),
            ItemOptionMenu(
              text: 'Registrar cliente',
              icon: const Icon(
                Icons.person,
                size: 35,
              ),
              onClick: () {
                context.push('/registerClient');
              },
            ),
            const SizedBox(height: 15),
            ItemOptionMenu(
              text: 'Registrar transportista',
              icon: const Icon(
                Icons.person,
                size: 35,
              ),
              onClick: () {
                context.push('/registerTransport');
              },
            ),
            const SizedBox(height: 15),
            ItemOptionMenu(
              text: 'Registrar vehículo',
              icon: const Icon(
                Icons.car_repair,
                size: 35,
              ),
              onClick: () {
                context.push('/registerVehicle');
              },
            ),
            const SizedBox(height: 15),
            ItemOptionMenu(
              text: 'Registrar orden de envio',
              icon: const Icon(
                Icons.archive,
                size: 35,
              ),
              onClick: () {
                context.push('/registerOrder');
              },
            ),
          ],
        ),
      ),
    );
  }
}
