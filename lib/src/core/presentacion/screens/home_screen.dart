import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stotppub/src/core/presentacion/providers/sign_in_provider.dart';
import 'package:stotppub/src/core/presentacion/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var type = ref.read(userType);

    return Scaffold(
      // backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hola ',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'USUARIO',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push('/profile');
                        },
                        child: const Icon(Icons.person),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.logout_outlined),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.black87,
                thickness: 1.5,
              ),
              const SizedBox(height: 25),
              ItemOptionMenu(
                text: 'Pedidos en curso',
                icon: const Icon(
                  Icons.send_rounded,
                  size: 35,
                ),
                onClick: () {
                  context.push('/orderClient');
                },
              ),
              const SizedBox(height: 65),
              if (type == 'transportista') const OptionsMenuTransport(),
              if (type == 'cliente') const OptionsMenuTransport(),
              if (type == 'admin') const OptionsMenuAdmin(),
            ],
          ),
        ),
      ),
    );
  }
}
