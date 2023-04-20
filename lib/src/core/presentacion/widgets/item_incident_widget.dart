import 'package:flutter/material.dart';

class ItemIncidentWidget extends StatelessWidget {
  const ItemIncidentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String text = 'name';
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.indeterminate_check_box),
          Text(text),
        ],
      ),
    );
  }
}
