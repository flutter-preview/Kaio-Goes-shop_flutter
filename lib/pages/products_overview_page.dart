import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/badgee.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/models/cart.dart';

enum FilterOptions { favorite, all }

class ProdutcsOverviewPage extends StatefulWidget {
  const ProdutcsOverviewPage({super.key});

  @override
  State<ProdutcsOverviewPage> createState() => _ProdutcsOverviewPageState();
}

class _ProdutcsOverviewPageState extends State<ProdutcsOverviewPage> {
  bool showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Minha Loja"),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorite,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Todos'),
              )
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorite) {
                  showFavoriteOnly = true;
                } else {
                  showFavoriteOnly = false;
                }
              });
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (ctx, cart, child) => Badgee(
              value: cart.itemCount.toString(),
              child: child!,
            ),
          )
        ],
      ),
      body: ProductGrid(showFavoriteOnly: showFavoriteOnly),
    );
  }
}
