import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stotppub/src/core/presentacion/widgets/widgets.dart';

class OptionsMenuAdmin extends StatelessWidget {
  const OptionsMenuAdmin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '¡Que deseas realizar hoy?',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 15),
        ItemOptionMenu(
          text: 'Registrar Cliente',
          icon: const Icon(
            Icons.manage_search_rounded,
            size: 35,
          ),
          onClick: () {
            context.push('/registerTransport');
          },
        ),
        const SizedBox(height: 15),
        ItemOptionMenu(
          text: 'Registrar transportista',
          icon: const Icon(
            Icons.manage_search_rounded,
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
          text: 'Ver Perfiles',
          icon: const Icon(
            Icons.people,
            size: 35,
          ),
          onClick: () {
            // context.push('/registerVehicle');
          },
        ),
        const SizedBox(height: 15),
        ItemOptionMenu(
          text: 'Crear Solicitud',
          icon: const Icon(
            Icons.archive,
            size: 35,
          ),
          onClick: () {
            context.push('/registerOrder');
          },
        ),
        const SizedBox(height: 15),
        ItemOptionMenu(
          text: 'Visualizar envios',
          icon: const Icon(
            Icons.fmd_good_sharp,
            size: 35,
          ),
          onClick: () {
            context.push('/showShipment');
          },
        ),
      ],
    );
  }
}
