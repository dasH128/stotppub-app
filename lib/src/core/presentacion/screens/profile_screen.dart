import 'package:flutter/material.dart';
import 'package:stotppub/src/core/presentacion/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    var colorPrimary = color.primary;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    );
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
            
              children: [
                Stack(
                  children: [
                    ClipOval(
                      child: Material(
                        child: Container(
                          child: Ink.image(
                            image: const NetworkImage(
                                'https://pub-static.fotor.com/assets/projects/pages/d5bdd0513a0740a8a38752dbc32586d0/fotor-03d1a91a0cec4542927f53c87e0599f6.jpg'),
                            width: 128,
                            height: 128,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 5,
                      child: ClipOval(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          color: Colors.purpleAccent,
                          child: ClipOval(
                              child: Container(
                                  padding: EdgeInsets.all(8),
                                  color: Colors.amber,
                                  child: Icon(Icons.edit))),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                TextFormFieldCustom1(
                  label: 'Nombre',
                  initialValue: 'Dash',
                ),
                const SizedBox(height: 15),
                TextFormFieldCustom1(
                  label: 'Email',
                  initialValue: 'cliente@gmail.com',
                ),
                const SizedBox(height: 15),
                TextFormFieldCustom1(
                  label: 'Celular',
                  initialValue: '980873988',
                ),
                const SizedBox(height: 15),
                TextFormFieldCustom1(
                  label: 'Dirección',
                  initialValue: 'Av. Aviación 5370 - San Borja',
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
