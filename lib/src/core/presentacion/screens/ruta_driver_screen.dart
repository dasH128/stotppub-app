import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RutaDriverScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic>? mapa;
  const RutaDriverScreen({super.key, this.mapa});

  @override
  RutaDriverScreenState createState() => RutaDriverScreenState();
}

class RutaDriverScreenState extends ConsumerState<RutaDriverScreen> {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  final Set<Polyline> _polyline = {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Stream<DocumentSnapshot<Map<String, dynamic>>> documentStream =
        FirebaseFirestore.instance
            .collection('order')
            .doc(widget.mapa!["idOrden"])
            .snapshots();
    print(widget.mapa!["latOrigen"]);
    print(widget.mapa!["lngOrigen"]);
    print(widget.mapa!["idOrden"]);

    return Scaffold(
      body: StreamBuilder(
        stream: documentStream, //_geolocatorPlatform.getCurrentPosition(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          // Position? positionCurrent = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          print('STREAMMMMMMMM');
          print(snapshot.data?.get('latOrigen'));
          print(snapshot.data?.get('lngOrigen'));
          print(snapshot.data?.get('lat'));
          print(snapshot.data?.get('lng'));
          CameraPosition _positionCamera = CameraPosition(
            target: LatLng(
              snapshot.data?.get('latOrigen'), //widget.mapa!["latOrigen"],
              snapshot.data?.get('lngOrigen'), //widget.mapa!["lngOrigen"],
            ),
            zoom: 14.4746,
          );

          // final Map<String, Polyline> polis;
          // final p1 = Polyline(
          //   polylineId: PolylineId('myRot1'),
          //   color: Colors.red,
          //   width: 5,
          //   startCap: Cap.roundCap,
          //   endCap: Cap.roundCap,
          //   points: [
          //     LatLng(
          //       widget.mapa!["latOrigen"],
          //       widget.mapa!["lngOrigen"],
          //     ),
          //   ],
          // );

          return Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                mapToolbarEnabled: true,
                initialCameraPosition: _positionCamera,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                markers: {
                  Marker(
                    markerId: const MarkerId('MarkerId1'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueAzure,
                    ),
                    position: LatLng(
                      snapshot.data?.get('latOrigen'),
                      snapshot.data?.get('lngOrigen'),
                    ),
                  ),
                  Marker(
                    markerId: const MarkerId('MarkerId2'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed,
                    ),
                    position: LatLng(
                      snapshot.data?.get('lat'),
                      snapshot.data?.get('lng'),
                    ),
                  ),
                },
                polylines: {
                  Polyline(
                    polylineId: PolylineId('myRot1'),
                    color: Colors.red,
                    width: 5,
                    startCap: Cap.roundCap,
                    endCap: Cap.roundCap,
                    points: [
                      LatLng(
                        snapshot.data
                            ?.get('latOrigen'), //widget.mapa!["latOrigen"],
                        snapshot.data
                            ?.get('lngOrigen'), //widget.mapa!["lngOrigen"],
                      ),
                      LatLng(
                        snapshot.data?.get('lat'), //widget.mapa!["latOrigen"],
                        snapshot.data?.get('lng'), //widget.mapa!["lngOrigen"],
                      ),
                    ],
                  )
                },
                // onCameraMove: (CameraPosition pos) {
                //   ref
                //       .read(cmrUbicationProvider.notifier)
                //       .update((state) => pos);
                // },
              ),
            ],
          );
        },
      ),
    );
  }
}
