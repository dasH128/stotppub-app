import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../providers/sign_in_provider.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ViewSigIn viewSigIn = ref.watch(viewSigInCurrentPovider);
    print('view $viewSigIn');
    return Scaffold(
      body: SafeArea(
        child: (viewSigIn == ViewSigIn.signIn)
            ? LoginContainer()
            : (viewSigIn == ViewSigIn.tutorial)
                ? TutorialContainer()
                : SelectedTypeOfNewUserContainer(),
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
              context.push('signUpClient');
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
            onTap: () {},
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
                const Text(
                  'Iniciar sesisón',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 25),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Usuario',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Olvide mi contraseça',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Recordar mis datos',
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  height: 48,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.amber,
                  elevation: 80,
                  onPressed: () {},
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Iniciar',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'No tines cuenta? ',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextSpan(
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            print('CLICKKKK');
                            ref.read(viewSigInCurrentPovider.notifier).state =
                                ViewSigIn.selectedTypeUser;
                          },
                        text: 'REGISTRATE',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
