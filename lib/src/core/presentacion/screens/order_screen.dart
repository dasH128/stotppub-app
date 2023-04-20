import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stotppub/src/core/presentacion/widgets/widgets.dart';

class OrderScreen extends StatefulWidget {
  final int? initView;
  const OrderScreen({super.key, this.initView = 0});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  int indexView = 0;
  late TabController _controller;

  @override
  void initState() {
    super.initState();

    print('da ${widget.initView}');
    _controller = TabController(
      initialIndex: widget.initView!,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos ...'),
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(icon: Icon(Icons.contacts), text: "En Proceso"),
            Tab(text: "Entregado"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          TabView01(),
          TabView02(),
        ],
      ),
    );
  }
}

class TabView01 extends ConsumerWidget {
  const TabView01({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return const ItemOrderInProcessWidget(
            orderDate: 'Lunes 17 / 01 / 2023',
            product: 'PALTAS',
            code: 'XXXXX',
            state: 'En camino',
            numberOrder: 'xxxxxxxxxxx',
            estimatedDate: '02/12/2023',
            address: 'Av. xxxxxxxxxxxxx',
            nameTransport: 'Pedro Gonzales',
          );
        },
      ),
    );
  }
}

class TabView02 extends StatelessWidget {
  const TabView02({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return const ItemOrderDeliveredWidget(
            orderDate: 'Lunes 17 / 01 / 2023',
            product: 'PALTAS',
            code: 'XXXXX',
            state: 'En camino',
            numberOrder: 'xxxxxxxxxxx',
            estimatedDate: '02/12/2023',
            address: 'Av. xxxxxxxxxxxxx',
            nameClient: 'Valeria Nathaly Collazo',
            nameTransport: 'Pedro Gonzales',
            propertyCard: 'KDF -123',
            typePerishable: 'Fruta',
          );
        },
      ),
    );
  }
}
