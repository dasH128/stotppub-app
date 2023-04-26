import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stotppub/src/core/presentacion/widgets/button_custom1_widget.dart';

class IncidentDetailScreen extends StatelessWidget {
  const IncidentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(
        37.42796133580664,
        -122.085749655962,
      ),
      zoom: 14.4746,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.5,
                color: Colors.red,
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                ),
              ),
              Container(
                width: double.infinity,
                height: size.height * 0.1,
                color: Colors.amberAccent,
                child: Text('INCIDENCIA REPORTADA'),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.all(16),
                            child: const Icon(Icons.gps_fixed)),
                        const Expanded(
                          child: Text('LUGAR'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.all(16),
                            child: const Icon(Icons.hourglass_bottom)),
                        const Expanded(
                          child: Text('6: 50 pm'),
                        ),
                      ],
                    ),
                    Text('Descripción'),
                    Text(
                        'Deslizamiento de piedras, demora en liberación de la carretera'),
                    ButtonCustom1Widget(
                      text: 'LLamar',
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
