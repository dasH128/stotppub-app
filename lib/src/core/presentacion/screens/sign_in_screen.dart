import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart';
import 'package:stotppub/src/core/presentacion/widgets/widgets.dart';

import '../providers/sign_in_provider.dart';

class SignInScreen extends ConsumerWidget {
  final storage = new LocalStorage('my_data.json');

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ViewSigIn viewSigIn = ref.watch(viewSigInCurrentPovider);
    print('view $viewSigIn');

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: storage.ready,
            builder: (BuildContextcontext, AsyncSnapshot snapshot) {
              if (snapshot.data == true) {
                bool isLogged = storage.getItem('isLogged') ?? false;
                print('esta logiuueado $isLogged');

                return (viewSigIn == ViewSigIn.signIn)
                    ? const LoginContainer()
                    : (viewSigIn == ViewSigIn.tutorial)
                        ? const TutorialContainer()
                        : const SelectedTypeOfNewUserContainer();
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

class SelectedTypeOfNewUserContainer extends StatelessWidget {
  const SelectedTypeOfNewUserContainer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Tipo de cuenta',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          GestureDetector(
            onTap: () {
              context.push('/signUpClient');
            },
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      'assets/svgs/type_client.svg',
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Text(
                    'Cliente',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.push('/signUpTransport');
            },
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      'assets/svgs/type_transport.svg',
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Text(
                    'Transportista',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TutorialContainer extends ConsumerWidget {
  const TutorialContainer({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          Row(
            children: [
              Text('Te damos la bienvenida a ......'),
              GestureDetector(
                onTap: () {
                  ref.read(viewSigInCurrentPovider.notifier).state =
                      ViewSigIn.signIn;
                },
                child: Icon(Icons.close),
              ),
            ],
          ),
          Container(),
        ],
      ),
    );
  }
}

class LoginContainer extends ConsumerWidget {
  const LoginContainer({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Container(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  child: SvgPicture.asset('assets/svgs/intro_app.svg'),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          ref.read(viewSigInCurrentPovider.notifier).state =
                              ViewSigIn.tutorial;
                        },
                        child: Icon(Icons.help),
                      )),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            decoration: const BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                const _TitleContainer(),
                const SizedBox(height: 25),
                _FormName(emailController: _emailController),
                const SizedBox(height: 15),
                _FormPassword(passwordController: _passwordController),
                const SizedBox(height: 15),
                const Text(
                  'Olvide mi contraseça',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                const _TextRemenberContainer(),
                const SizedBox(height: 10),
                _ButtonContainer(emailController: _emailController),
                const SizedBox(height: 10),
                const _TextRegisterContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TextRemenberContainer extends ConsumerWidget {
  const _TextRemenberContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool switchValue = ref.watch(rememberUserPovider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Recordar mis datos',
          style: TextStyle(fontSize: 18),
        ),
        Switch(
          value: switchValue,
          onChanged: (value) {
            ref.read(rememberUserPovider.notifier).state = value;
          },
        ),
      ],
    );
  }
}

class _TextRegisterContainer extends ConsumerWidget {
  const _TextRegisterContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'No tines cuenta? ',
            style: TextStyle(fontSize: 18),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                ref.read(viewSigInCurrentPovider.notifier).state =
                    ViewSigIn.selectedTypeUser;
              },
            text: 'REGISTRATE',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class _ButtonContainer extends ConsumerWidget {
  const _ButtonContainer({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ButtonCustom1Widget(
      text: 'INICIAR',
      onPressed: () async {
        final storage = new LocalStorage('my_data.json');
        if (_emailController.text == 'admin@gmail.com') {
          ref.read(userType.notifier).state = 'admin';
          await storage.setItem('userType', 'admin');
          context.push('/home');
        }
        if (_emailController.text == 'transportista@gmail.com') {
          ref.read(userType.notifier).state = 'transportista';
          await storage.setItem('userType', 'transportista');
          context.push('/home');
        }
        if (_emailController.text == 'cliente@gmail.com') {
          ref.read(userType.notifier).state = 'cliente';
          await storage.setItem('userType', 'cliente');
          context.push('/home');
        }

        // await storage.setItem('isLogged', true);
        // context.push('/home');
      },
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

class _FormName extends StatelessWidget {
  const _FormName({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Usuario',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _TitleContainer extends StatelessWidget {
  const _TitleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Iniciar sesisón',
      style: TextStyle(fontSize: 24),
    );
  }
}
