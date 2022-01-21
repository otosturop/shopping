import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/orders.dart' show Orders;
import 'package:shopping/widgets/app_drawer.dart';
import 'package:shopping/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      ),
      drawer: AppDrawer(),
    );
  }
}
