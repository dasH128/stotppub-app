import 'package:flutter/material.dart';

class ItemTransportAvailableWidget extends StatelessWidget {
  final String name;
  final String lastName;
  final String propertyCard;
  final String numberOfAxes;
  final String long;
  final String width;
  final bool hasSoat;
  final bool hasRefrigeration;
  const ItemTransportAvailableWidget({
    super.key,
    required this.name,
    required this.lastName,
    required this.propertyCard,
    required this.numberOfAxes,
    required this.long,
    required this.width,
    required this.hasSoat,
    required this.hasRefrigeration,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.primary.withOpacity(0.15),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ExpansionTile(
          title: Text('$name $lastName'),
          children: [
            Container(
              child: Column(
                children: [
                  Table(
                    children: [
                      TableRow(
                        children: [
                          const Text('Placa: '),
                          Text(propertyCard),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Nº de ejes: '),
                          Text(numberOfAxes),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Ancho: '),
                          Text(width),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Largo: '),
                          Text(long),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Refrigeración: '),
                          Text((hasRefrigeration) ? 'SI' : 'NO'),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Soat: '),
                          Text((hasSoat) ? 'SI' : 'NO'),
                        ],
                      ),
                    ],
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('ASIGNAR'),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
