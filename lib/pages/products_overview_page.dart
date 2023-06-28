import 'package:flutter/material.dart';
import 'package:shop/components/product_grid.dart';

class ProdutcsOverviewPage extends StatelessWidget {
  const ProdutcsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Minha Loja"),
      ),
      body: const ProductGrid(),
    );
  }
}
