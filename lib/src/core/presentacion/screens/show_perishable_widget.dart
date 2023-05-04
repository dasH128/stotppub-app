import 'package:flutter/material.dart';

class ShowPerishableWidget extends StatelessWidget {
  const ShowPerishableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perecederos'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (_, int i) {
            return Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.purpleAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text('title $i'),
                leading: const Icon(Icons.balance_rounded),
              ),
            );
          },
        ),
      ),
    );
  }
}
