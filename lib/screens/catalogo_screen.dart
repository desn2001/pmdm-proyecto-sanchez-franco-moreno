
import 'package:flutter/material.dart';

import '../data/productos_ejemplo.dart';
import '../widgets/producto_tile.dart';

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ElectroÁguilas'),
      ),
      body: ListView.builder(
        itemCount: productosEjemplo.length,
        itemBuilder: (context, index) {
          final producto = productosEjemplo[index];

          return ProductoTile(producto: producto);
        },
      ),
    );
  }
}

