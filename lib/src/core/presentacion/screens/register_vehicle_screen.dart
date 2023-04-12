import 'package:flutter/material.dart';

class RegisterVehicleScreen extends StatelessWidget {
  const RegisterVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _registrationNumberController =
        TextEditingController();
    bool hasSoat;
    TextEditingController _propertyCardController = TextEditingController();
    TextEditingController _numberOfAxesController = TextEditingController();
    TextEditingController _widthController = TextEditingController();
    TextEditingController _longController = TextEditingController();
    bool hasRefrigeration;
    bool hasSure;

    return Scaffold(
      body: Builder(builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Registrar Vehículo'),
                background: Image.asset(
                  'assets/images/register_vehicle.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                child: Column(
                  children: [
                    _FormRegistartionNumber(
                        registrationNumberController:
                            _registrationNumberController),
                    const SizedBox(height: 10),
                    _FormPropertyCard(
                        propertyCardController: _propertyCardController),
                    const SizedBox(height: 10),
                    _FormNumberOfAxes(
                        numberOfAxesController: _numberOfAxesController),
                    const SizedBox(height: 10),
                    _FormWidth(widthController: _widthController),
                    const SizedBox(height: 10),
                    _FormLong(longController: _longController),
                    const SizedBox(height: 10),
                    MaterialButton(
                      height: 48,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {},
                      // color: Colors.amberAccent,
                      child: Text('Registrar'),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

class _FormLong extends StatelessWidget {
  const _FormLong({
    super.key,
    required TextEditingController longController,
  }) : _longController = longController;

  final TextEditingController _longController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _longController,
      decoration: const InputDecoration(
        hintText: 'Largo',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _FormWidth extends StatelessWidget {
  const _FormWidth({
    super.key,
    required TextEditingController widthController,
  }) : _widthController = widthController;

  final TextEditingController _widthController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _widthController,
      decoration: const InputDecoration(
        hintText: 'Ancho',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _FormNumberOfAxes extends StatelessWidget {
  const _FormNumberOfAxes({
    super.key,
    required TextEditingController numberOfAxesController,
  }) : _numberOfAxesController = numberOfAxesController;

  final TextEditingController _numberOfAxesController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _numberOfAxesController,
      decoration: const InputDecoration(
        hintText: 'Número de ejes',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _FormPropertyCard extends StatelessWidget {
  const _FormPropertyCard({
    super.key,
    required TextEditingController propertyCardController,
  }) : _propertyCardController = propertyCardController;

  final TextEditingController _propertyCardController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _propertyCardController,
      decoration: const InputDecoration(
        hintText: 'Tarjeta de Propiedad',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _FormRegistartionNumber extends StatelessWidget {
  const _FormRegistartionNumber({
    super.key,
    required TextEditingController registrationNumberController,
  }) : _registrationNumberController = registrationNumberController;

  final TextEditingController _registrationNumberController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _registrationNumberController,
      decoration: const InputDecoration(
        hintText: 'Placa',
        border: OutlineInputBorder(),
      ),
    );
  }
}
