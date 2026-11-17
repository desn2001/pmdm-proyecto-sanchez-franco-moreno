import 'package:flutter/material.dart';

import '../data/productos_ejemplo.dart';
import '../models/producto.dart';
import '../widgets/producto_tile.dart';
import 'detalle_screen.dart';

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  // Copia modificable: productosEjemplo es const/final y no se puede borrar de ella.
  late final List<Producto> _productos = List.of(productosEjemplo);

  void _abrirDetalle(Producto producto) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetalleScreen(producto: producto)),
    );
  }

  Future<void> _confirmarBorrado(Producto producto) async {
    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Borrar producto'),
        content: Text('¿Seguro que quieres borrar "${producto.nombre}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Borrar'),
          ),
        ],
      ),
    );

    if (confirmado == true) {
      setState(() => _productos.remove(producto));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ElectroÁguilas'),
      ),
      body: ListView.builder(
        itemCount: _productos.length,
        itemBuilder: (context, index) {
          final producto = _productos[index];

          return ProductoTile(
            producto: producto,
            onTap: () => _abrirDetalle(producto),
            onLongPress: () => _confirmarBorrado(producto),
          );
        },
      ),
    );
  }
}