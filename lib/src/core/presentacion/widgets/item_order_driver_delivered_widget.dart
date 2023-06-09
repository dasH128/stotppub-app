import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stotppub/src/core/config/app_theme.dart';

class ItemOrderDriverDeliveredWidget extends StatelessWidget {
  final String product;
  final String code;
  final String state;
  final String numberOrder;
  final String orderDate;
  final String estimatedDate;
  final String address;
  final String nameClient;
  final String nameTransport;
  final String propertyCard;
  final String typePerishable;
  const ItemOrderDriverDeliveredWidget({
    super.key,
    required this.product,
    required this.code,
    required this.state,
    required this.numberOrder,
    required this.orderDate,
    required this.estimatedDate,
    required this.address,
    required this.nameClient,
    required this.nameTransport,
    required this.propertyCard,
    required this.typePerishable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MyAppTheme.color.withOpacity(0.25),
          ),
      child: ExpansionTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(orderDate),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.share),
                )
              ],
            ),
            const SizedBox(height: 5),
            const Divider(height: 2),
            const SizedBox(height: 10),
            Text('$product - ${numberOrder.substring(0, 5)} '),
            const Text('En sucursal'),
          ],
        ),
        children: [
          Container(
            padding: const EdgeInsetsDirectional.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Nº de envio:'),
                        Text(numberOrder),
                      ],
                    ),
                    const Icon(Icons.copy),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Fecha de entrega estimada:'),
                Text(estimatedDate),
                const SizedBox(height: 10),
                const Text('Cliente:'),
                Text(nameClient),
                const SizedBox(height: 10),
                const Text('Lugar de destino'),
                Text(address),

                // const SizedBox(height: 10),
                // const Text('Transportista'),
                // Text(nameTransport),
                // const SizedBox(height: 10),
                // const Text('Placa de camión'),
                // Text(propertyCard),
                // const SizedBox(height: 10),
                // const Text('Tipo de perecedero'),
                // Text(typePerishable),
                const SizedBox(height: 10),
                // Center(
                //   child: OutlinedButton(
                //     onPressed: () {},
                //     child: Text('RUTA'),
                //   ),
                // ),
                Center(
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO:dash ver historial de incidencias
                      Map<String, dynamic> mapa = {
                        "idOrden": numberOrder,
                      };

                      print('LISTA DE INCIDENTE A ENVIAR ${mapa["idOrden"]}');
                      context.push('/incident', extra: mapa);
                    },
                    child: const Text('VER PERFIL DE INCIDENCIAS'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
