import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/products.dart';
import 'package:shopping/screen/edit_product_screen.dart';
import 'package:shopping/widgets/app_drawer.dart';
import 'package:shopping/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName,
                  arguments: 'newProduct');
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                productData.items[i].id,
                productData.items[i].title,
                productData.items[i].imageUrl,
              ),
              Divider()
            ],
          ),
          itemCount: productData.items.length,
        ),
      ),
    );
  }
}
