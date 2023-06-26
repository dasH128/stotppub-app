import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stotppub/src/core/config/app_theme.dart';

class ItemShipmentWidget extends StatelessWidget {
  final String title;
  final String code;
  final String state;

  const ItemShipmentWidget({
    super.key,
    required this.title,
    required this.code,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        context.push('/showShipmentUbication');
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: MyAppTheme.color
              .withOpacity(0.15), //color.primary.withOpacity(0.15),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          title: Text(title),
          subtitle: Text('N° Orden: ${code.substring(0, 8)} '),
          trailing: const Icon(Icons.details_rounded),
        ),
      ),
    );
  }
}
