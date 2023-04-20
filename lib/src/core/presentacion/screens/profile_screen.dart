import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(),
                TextFormField(
                  decoration: InputDecoration(labelText: 'HOLA'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
