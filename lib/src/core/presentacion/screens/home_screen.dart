import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Hola ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'USUARIO',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.black87,
                thickness: 1.5,
              ),
              const SizedBox(height: 25),
              const ItemOptionMenu(
                text: 'Pedidos en curso',
                icon: Icon(
                  Icons.send_rounded,
                  size: 35,
                ),
              ),
              const SizedBox(height: 65),
              OptionsMenuTransport(),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionsMenuClient extends StatelessWidget {
  const OptionsMenuClient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '¡Que deseas averiguar?',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 15),
        const ItemOptionMenu(
          text: 'Mis envios entregados',
          icon: Icon(
            Icons.manage_search_rounded,
            size: 35,
          ),
        ),
        const SizedBox(height: 15),
        const ItemOptionMenu(
          text: 'Ver reportes de incidencias',
          icon: Icon(
            Icons.insert_chart_outlined_rounded,
            size: 35,
          ),
        ),
      ],
    );
  }
}

class OptionsMenuTransport extends StatelessWidget {
  const OptionsMenuTransport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '¡Que deseas averiguar?',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 15),
        const ItemOptionMenu(
          text: 'Información de mis pedidos',
          icon: Icon(
            Icons.manage_search_rounded,
            size: 35,
          ),
        ),
        const SizedBox(height: 15),
        const ItemOptionMenu(
          text: 'Ingresar código de servicios',
          icon: Icon(
            Icons.send_rounded,
            size: 35,
          ),
        ),
      ],
    );
  }
}

class ItemOptionMenu extends StatelessWidget {
  final String text;
  final Widget icon;
  const ItemOptionMenu({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(
          child: ListTile(
            title: Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
            leading: icon,
          ),
        ),
      ),
    );
  }
}
