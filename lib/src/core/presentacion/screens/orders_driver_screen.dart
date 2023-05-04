import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stotppub/src/core/presentacion/providers/show_order_provider.dart';
import 'package:stotppub/src/core/presentacion/widgets/widgets.dart';

class OrdersDriverScreen extends StatefulWidget {
  final int? initView;
  const OrdersDriverScreen({super.key, this.initView});

  @override
  State<OrdersDriverScreen> createState() => _OrdersDriverScreenState();
}

class _OrdersDriverScreenState extends State<OrdersDriverScreen>
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
        title: const Text('Mis Pedidos'),
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(text: "En Proceso"),
            Tab(text: "Entregado"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          TabOrdersProcesByDriver(),
          TabOrdersFinalizedByDriver(),
        ],
      ),
    );
  }
}

class TabOrdersFinalizedByDriver extends ConsumerWidget {
  const TabOrdersFinalizedByDriver({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var all = ref.watch(allOrdersFinalizedByDriverIdProvider);
    return Container(
      child: all.when(
        data: (data) {
          return ListView.builder(
              itemCount: 6,
              itemBuilder: (_, int i) {
                return const ItemOrderDriverInProcessWidget(
                  orderDate: 'Lunes 17 / 01 / 2023',
                  product: 'PALTAS',
                  code: 'XXXXX',
                  state: 'En camino',
                  numberOrder: 'xxxxxxxxxxx',
                  estimatedDate: '02/12/2023',
                  address: 'Av. xxxxxxxxxxxxx',
                  nameTransport: 'Pedro Gonzales',
                );
              });
        },
        error: (e, _) => Text('Hubo un error ${e.toString()}'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class TabOrdersProcesByDriver extends ConsumerWidget {
  const TabOrdersProcesByDriver({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var all = ref.watch(allOrdersProcesByDriverIdProvider);
    return Container(
      child: all.when(
        data: (data) {
          return ListView.builder(
              itemCount: 6,
              itemBuilder: (_, int i) {
                return const ItemOrderDriverInProcessWidget(
                  orderDate: 'Lunes 17 / 01 / 2023',
                  product: 'PALTAS',
                  code: 'XXXXX',
                  state: 'En camino',
                  numberOrder: 'xxxxxxxxxxx',
                  estimatedDate: '02/12/2023',
                  address: 'Av. xxxxxxxxxxxxx',
                  nameTransport: 'Pedro Gonzales',
                );
              });
        },
        error: (e, _) => Text('Hubo un error ${e.toString()}'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
