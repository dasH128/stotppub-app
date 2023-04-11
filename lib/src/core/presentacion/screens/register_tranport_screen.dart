import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Register'),
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
                    _FormName(nameController: _nameController),
                    const SizedBox(height: 10),
                    _FormLastName(lastNameController: _lastNameController),
                    const SizedBox(height: 10),
                    _FormEmail(emailController: _emailController),
                    const SizedBox(height: 10),
                    _FormNumber(numberController: _numberController),
                    const SizedBox(height: 10),
                    _FormPassword(passwordController: _passwordController),
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

class _ButtonRegister extends StatelessWidget {
  const _ButtonRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.amber,
      onPressed: () {
        //context.push('/home');
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
    return TextField(
      controller: _lastNameController,
      decoration: const InputDecoration(
        hintText: 'Apellidos',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _FormName extends StatelessWidget {
  const _FormName({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _nameController,
      decoration: const InputDecoration(
        hintText: 'Nombre',
        border: OutlineInputBorder(),
      ),
    );
  }
}
