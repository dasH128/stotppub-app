import 'package:flutter/material.dart';

class ItemOrderWidget extends StatelessWidget {
  const ItemOrderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black12,
      ),
      child: ExpansionTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Lunes 17 / 01 / 2023'),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.share),
                )
              ],
            ),
            const SizedBox(height: 5),
            const Divider(height: 2),
            const SizedBox(height: 10),
            const Text('PALTAS - xxxxxx '),
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
                      children: const [
                        Text('Nº de envio:'),
                        Text('XXXXXXXXXXXXXX'),
                      ],
                    ),
                    Icon(Icons.copy),
                  ],
                ),
                Text('Fecha de entrega estimada:'),
                Text('02/12/2023'),
                const SizedBox(height: 10),
                Text('Conductor asigando'),
                Text('Pedro Gonzales'),
                const SizedBox(height: 10),
                Text('Lugar de destino'),
                Text('Av. xxxxxxxxxxxxx'),
                const SizedBox(height: 10),
                Center(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('VER PERFIL DE INCIDENCIAS'),
                  ),
                ),
                Center(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('VER RECORRIDO DEL ENVIO'),
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
