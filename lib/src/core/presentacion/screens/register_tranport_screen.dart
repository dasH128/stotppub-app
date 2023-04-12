import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../providers/register_transport_provider.dart';

class RegisterTransportScreen extends StatelessWidget {
  const RegisterTransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _rucController = TextEditingController();
    TextEditingController _addressController = TextEditingController();
    TextEditingController _numberController = TextEditingController();
    TextEditingController _licenseNumberController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Registrar Transportista'),
                background: Image.asset(
                  'assets/images/register_transport.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _FormName(),
                            const SizedBox(height: 10),
                            _FormLastName(
                                lastNameController: _lastNameController),
                            const SizedBox(height: 10),
                            _FormEmail(emailController: _emailController),
                            const SizedBox(height: 10),
                            _FormNumber(numberController: _numberController),
                            const SizedBox(height: 10),
                            _FormPassword(
                                passwordController: _passwordController),
                          ],
                        )),
                    const SizedBox(height: 10),
                    const _ButtonRegister(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ButtonRegister extends ConsumerWidget {
  const _ButtonRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.amber,
      onPressed: () {
        //context.push('/home');
        var nameController = ref.read(nameProvider);
        print('name is ${nameController.text}');
      },
      child: const SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            'Registrar',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _FormPassword extends StatelessWidget {
  const _FormPassword({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: 'Contraseña',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.remove_red_eye),
      ),
    );
  }
}

class _FormNumber extends StatelessWidget {
  const _FormNumber({
    super.key,
    required TextEditingController numberController,
  }) : _numberController = numberController;

  final TextEditingController _numberController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _numberController,
      decoration: const InputDecoration(
        hintText: 'Teléfono',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _FormEmail extends StatelessWidget {
  const _FormEmail({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Correo',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _FormLastName extends StatelessWidget {
  const _FormLastName({
    super.key,
    required TextEditingController lastNameController,
  }) : _lastNameController = lastNameController;

  final TextEditingController _lastNameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _lastNameController,
      decoration: const InputDecoration(
        hintText: 'Apellidos',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == 'raa') return 'raa';
        return null;
      },
    );
  }
}

class _FormName extends ConsumerWidget {
  const _FormName();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nameController = ref.watch(nameProvider);
    return MyInputTextField(
      controller: nameController,
      text: 'Nombre',
    );
  }
}

class MyInputTextField extends StatelessWidget {
  const MyInputTextField({
    super.key,
    required TextEditingController controller,
    required String text,
  })  : _controller = controller,
        _text = text;

  final TextEditingController _controller;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: _text,
        border: const OutlineInputBorder(),
      ),
      validator: (v) {
        print('v is $v');
        return 'asd';
      },
    );
  }
}
