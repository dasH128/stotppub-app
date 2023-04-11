import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

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
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              indicatorStyle: IndicatorStyle(
                iconStyle: IconStyle(
                  color: Colors.white,
                  iconData: Icons.check,
                ),
              ),
              endChild: Container(
                constraints: const BoxConstraints(
                  minHeight: 10,
                ),
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('FECHA 14/02/2023'),
                      Text('LUGAR Moyobamba'),
                      Text('HISTORIA Ingreso'),
                    ],
                  ),
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              indicatorStyle: IndicatorStyle(
                iconStyle: IconStyle(
                  color: Colors.white,
                  iconData: Icons.check,
                ),
              ),
              endChild: Container(
                constraints: const BoxConstraints(
                  minHeight: 10,
                ),
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('FECHA 21/02/2023'),
                      Text('LUGAR Moyobamba'),
                      Text('HISTORIA Ingreso'),
                    ],
                  ),
                ),
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              indicatorStyle: IndicatorStyle(
                iconStyle: IconStyle(
                  color: Colors.white,
                  iconData: Icons.check,
                ),
              ),
              endChild: Container(
                constraints: const BoxConstraints(
                  minHeight: 10,
                ),
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('FECHA 01/02/2023'),
                      Text('LUGAR Moyobamba'),
                      Text('HISTORIA Ingreso'),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('VER REPORTE DE INCIDENCIAS'),
              ),
            ),
          ],
        ));
  }
}
