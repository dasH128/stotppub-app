import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:stotppub/src/core/data/entity/entity.dart';
import 'package:stotppub/src/core/presentacion/providers/register_order_provider.dart';
import 'package:stotppub/src/core/presentacion/widgets/snackbar_widget.dart';
import 'package:stotppub/src/core/presentacion/widgets/widgets.dart';

class RegisterOrderScreen extends ConsumerStatefulWidget {
  const RegisterOrderScreen({super.key});

  @override
  RegisterOrderScreenState createState() => RegisterOrderScreenState();
}

class RegisterOrderScreenState extends ConsumerState<RegisterOrderScreen> {
  late PageController pageController;
  String codigoCreado = '';
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Crear Solicitud'),
                background: Image.asset(
                  'assets/images/register_request.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              pageViewContentData(ref),
              pageViewContentTransportAsignar(ref),
              pageViewContentVehicleAsignar(ref),
              pageViewContentInfo(ref)
            ],
          ),
        ),
      ),
    );
  }

  Widget pageViewContentData(WidgetRef ref) {
    RegisterOrderFormNotifier notifier =
        ref.watch(registerOrderStateNotifierProvider.notifier);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormFieldCustom1(
                    initialValue: notifier.state.idClient,
                    prefixIcon:
                        const Icon(Icons.align_horizontal_right_outlined),
                    hint: 'Ingrese DNI cliente',
                    onChanged: (value) {
                      notifier.setDNI(value);
                    },
                  ),
                ),
                Container(
                  width: 90,
                  padding: const EdgeInsets.all(8),
                  child: ButtonCustom1Widget(
                    text: 'VER',
                    onPressed: () async {
                      var data = await notifier.findClientByDni();
                      if (!data.isOk) {
                        var snackBar = snackBarWidget(
                          title: 'Error',
                          message: data.menssage,
                        );
                        ScaffoldMessenger.of(ref.context)
                            .showSnackBar(snackBar);
                      } else {
                        var snackBar = snackBarWidget(
                          type: ContentType.success,
                          title: 'Encontrado',
                          message:
                              'Usuario ${data.data!.name} ${data.data!.lastName}',
                        );
                        ScaffoldMessenger.of(ref.context)
                            .showSnackBar(snackBar);
                        notifier.setIdClient(data.data!.id!);
                      }
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            //TODO:
            //vincular con el dato del usuario
            TextFormFieldCustom1(
              initialValue: notifier.state.phone,
              prefixIcon: const Icon(Icons.align_horizontal_right_outlined),
              hint: 'Ingrese telefono',
              onChanged: (value) {
                notifier.setPhone(value);
              },
            ),
            const SizedBox(height: 15),
            //TODO
            // buscar por el nombre no GPS
            TextFormFieldCustom1(
              initialValue: notifier.state.address,
              prefixIcon: const Icon(Icons.align_horizontal_right_outlined),
              hint: 'Ingrese Direcciçon',
              onChanged: (value) {
                notifier.setAddress(value);
              },
            ),
            const SizedBox(height: 15),
            TextFormFieldCustom1(
              initialValue: notifier.state.date,
              prefixIcon: const Icon(Icons.date_range),
              hint: 'Ingrese Fecha',
              onChanged: (value) {
                notifier.setDate(value);
              },
            ),
            const SizedBox(height: 15),
            TextFormFieldCustom1(
              initialValue: notifier.state.product,
              prefixIcon: const Icon(Icons.production_quantity_limits),
              hint: 'Ingrese Producto',
              onChanged: (value) {
                notifier.setProduct(value);
              },
            ),
            const SizedBox(height: 15),
            TextFormFieldCustom1(
              initialValue: notifier.state.quantity,
              prefixIcon: const Icon(Icons.numbers),
              hint: 'Ingrese cantidad',
              onChanged: (value) {
                notifier.setQuantity(value);
              },
            ),
            const SizedBox(height: 15),
            ButtonCustom1Widget(
              text: 'ASIGNAR',
              onPressed: () {
                if (notifier.state.idClient == '') {
                  var snackBar = snackBarWidget(
                    title: 'Error',
                    message: 'No hay un cliente asociado',
                  );
                  ScaffoldMessenger.of(ref.context).showSnackBar(snackBar);
                } else {
                  pageController.animateToPage(
                    1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceIn,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget pageViewContentTransportAsignar(WidgetRef ref) {
    var all = ref.watch(allTransportProvider);

    return Container(
      child: all.when(
          data: (data) {
            List<RegisterTransportFormEntity> transports = data.map(
              (doc) {
                return RegisterTransportFormEntity(
                  name: doc["name"],
                  lastName: doc["lastName"],
                  id: doc['id'],
                );
              },
            ).toList();
            if (transports.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('No hay ningun Transportista'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ButtonCustom1Widget(
                      text: 'ATRAS',
                      onPressed: () {
                        ref.context.pop();
                      },
                    ),
                  ),
                ],
              );
            }
            return ListView.builder(
                itemCount: transports.length,
                itemBuilder: (_, i) {
                  RegisterTransportFormEntity transportData = transports[i];

                  return ItemTransportAvailableWidget(
                    name: transportData.name,
                    lastName: transportData.lastName,
                    licenseNumber: transportData.licenseNumber,
                    categoryLicense: transportData.categoryLicense,
                    onPressed: () {
                      RegisterOrderFormNotifier notifier =
                          ref.read(registerOrderStateNotifierProvider.notifier);
                      notifier.setIdDriver(transportData.id!);
                      // var fff = ref.read(registerOrderStateNotifierProvider);
                      // print(fff.ruc);
                      pageController.animateToPage(
                        2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.bounceIn,
                      );
                    },
                  );
                });
          },
          error: (e, _) => Text('Hubo un error ${e.toString()}'),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }

  Widget pageViewContentVehicleAsignar(WidgetRef ref) {
    var all = ref.watch(allVehicleProvider);
    return Container(
      child: all.when(data: (data) {
        var vehicles = data.map((doc) {
          return RegisterVehicleFormEntity(
            propertyCard: doc["propertyCard"],
            numberOfAxes: doc["numberOfAxes"],
            id: doc["id"],
            width: doc["width"],
            long: doc["long"],
            hasSoat: doc["hasSoat"],
            hasRefrigeration: doc["hasRefrigeration"],
          );
        }).toList();

        if (vehicles.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('No hay ningun Vehiculo'),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ButtonCustom1Widget(
                  text: 'ATRAS',
                  onPressed: () {
                    ref.context.pop();
                  },
                ),
              ),
            ],
          );
        }
        return ListView.builder(
            itemCount: vehicles.length,
            itemBuilder: (_, i) {
              RegisterVehicleFormEntity vehicleData = vehicles[i];

              return ItemVehicleAvailableWidget(
                id: vehicleData.id!,
                hasRefrigeration: vehicleData.hasRefrigeration,
                hasSoat: vehicleData.hasSoat,
                long: vehicleData.long,
                numberOfAxes: vehicleData.numberOfAxes,
                propertyCard: vehicleData.propertyCard,
                width: vehicleData.width,
                onPressed: () async {
                  RegisterOrderFormNotifier notifier =
                      ref.read(registerOrderStateNotifierProvider.notifier);
                  notifier.setIdVehicle(vehicleData.id!);

                  var isCreate = await notifier.addData();
                  if (isCreate.isOk) {
                    setState(() {
                      codigoCreado = isCreate.data!;
                    });
                  }
                  pageController.animateToPage(
                    3,
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceIn,
                  );
                },
              );
            });
      }, error: (e, _) {
        return Text('Hubo un error ${e.toString()}');
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }

  Widget pageViewContentInfo(WidgetRef ref) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Solicitud Asiganada'),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('N^ de envio: '), Text('2315213')],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Codigo asignado: '), Text('- $codigoCreado -')],
          ),
          const SizedBox(height: 25),
          ButtonCustom1Widget(
            text: 'Terminado',
            onPressed: () {
              ref.context.pop();
            },
          )
        ],
      ),
    );
  }
}
