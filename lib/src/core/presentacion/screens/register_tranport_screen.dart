import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stotppub/src/core/presentacion/widgets/widgets.dart';
import '../../data/entity/entity.dart';
import '../providers/register_transport_provider.dart';

class RegisterTransportScreen extends StatelessWidget {
  const RegisterTransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        children: const [
                          _FormName(),
                          SizedBox(height: 10),
                          _FormLastName(),
                          SizedBox(height: 10),
                          _FormRuc(),
                          SizedBox(height: 10),
                          _FormAddress(),
                          SizedBox(height: 10),
                          _FormNumber(),
                          SizedBox(height: 10),
                          _FormLicenseNumber(),
                          SizedBox(height: 10),
                          _FormTypeLicense(),
                          SizedBox(height: 10),
                          _FormEmail(),
                          SizedBox(height: 10),
                          _FormPassword(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const _ButtonRegister(),
                    const SizedBox(height: 20),
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

class _FormPassword extends ConsumerWidget {
  const _FormPassword();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RegisterTransportFormNotifier notifierForm =
        ref.watch(registerTransportStateNotifierProvider.notifier);

    return TextFormFieldCustom1(
      prefixIcon: const Icon(Icons.password),
      hint: 'Ingrese Password',
      onChanged: (value) {
        notifierForm.setPassword(value);
      },
    );
  }
}

class _FormNumber extends ConsumerWidget {
  const _FormNumber();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RegisterTransportFormNotifier notifierForm =
        ref.watch(registerTransportStateNotifierProvider.notifier);

    return TextFormFieldCustom1(
      prefixIcon: const Icon(Icons.phone),
      hint: 'Ingrese Número',
      onChanged: (value) {
        notifierForm.setNumber(value);
      },
    );
  }
}

class _FormEmail extends ConsumerWidget {
  const _FormEmail();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RegisterTransportFormNotifier notifierForm =
        ref.watch(registerTransportStateNotifierProvider.notifier);

    return TextFormFieldCustom1(
      prefixIcon: const Icon(Icons.email),
      hint: 'Ingrese Email',
      onChanged: (value) {
        notifierForm.setEmail(value);
      },
    );
  }
}

class _FormRuc extends ConsumerWidget {
  const _FormRuc();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RegisterTransportFormNotifier notifierForm =
        ref.watch(registerTransportStateNotifierProvider.notifier);

    return TextFormFieldCustom1(
      prefixIcon: const Icon(Icons.reduce_capacity),
      hint: 'Ingrese Ruc',
      onChanged: (value) {
        notifierForm.setRuc(value);
      },
    );
  }
}

class _FormLastName extends ConsumerWidget {
  const _FormLastName();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RegisterTransportFormNotifier notifierForm =
        ref.watch(registerTransportStateNotifierProvider.notifier);

    return TextFormFieldCustom1(
      prefixIcon: const Icon(Icons.person),
      hint: 'Ingrese Apellido',
      onChanged: (value) {
        notifierForm.setLastName(value);
      },
    );
  }
}

class _FormName extends ConsumerWidget {
  const _FormName();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RegisterTransportFormNotifier notifierForm =
        ref.watch(registerTransportStateNotifierProvider.notifier);

    return TextFormFieldCustom1(
      prefixIcon: const Icon(Icons.person),
      hint: 'Ingrese Nombre',
      onChanged: (value) {
        notifierForm.setName(value);
      },
    );
  }
}

class _FormAddress extends ConsumerWidget {
  const _FormAddress();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RegisterTransportFormNotifier notifierForm =
        ref.watch(registerTransportStateNotifierProvider.notifier);

    return TextFormFieldCustom1(
      prefixIcon: const Icon(Icons.directions),
      hint: 'Ingrese Dirección',
      onChanged: (value) {
        notifierForm.setAddress(value);
      },
    );
  }
}

class _FormLicenseNumber extends ConsumerWidget {
  const _FormLicenseNumber();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RegisterTransportFormNotifier notifierForm =
        ref.watch(registerTransportStateNotifierProvider.notifier);

    return TextFormFieldCustom1(
      prefixIcon: const Icon(Icons.add_card_outlined),
      hint: 'Ingrese Número de licensia',
      onChanged: (value) {
        notifierForm.setLicenseNumber(value);
      },
    );
  }
}

class _FormTypeLicense extends ConsumerWidget {
  const _FormTypeLicense();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RegisterTransportFormNotifier notifierForm =
        ref.watch(registerTransportStateNotifierProvider.notifier);
    const data = ['A I', 'A II', 'A III', 'B I', 'B II', 'B III'];
    var category =
        ref.watch(registerTransportStateNotifierProvider).categoryLicense;

    return TextOptionCustom1Widget(
      prefixIcon: const Icon(Icons.type_specimen),
      text: 'Ingrese Categoría de licensia',
      value: category,
      titleOption: 'Eliga una opcion:',
      valueOption: data,
      onChanged: (value) {
        if (value == null) return;
        notifierForm.setCategoryLicense(value);
        context.pop();
      },
    );
  }
}

class _ButtonRegister extends ConsumerWidget {
  const _ButtonRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ButtonCustom1Widget(
      text: 'Registrar',
      onPressed: () {
        RegisterTransportFormEntity transport = ref.read(registerTransportStateNotifierProvider.notifier).state;
        print(transport.name);
      },
    );
  }
}
