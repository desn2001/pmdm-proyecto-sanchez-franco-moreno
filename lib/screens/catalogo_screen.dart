import 'package:flutter/material.dart';

import '../data/productos_ejemplo.dart';
import '../models/producto.dart';
import '../widgets/producto_tile.dart';
import 'detalle_screen.dart';
import 'nuevo_producto_screen.dart';

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
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

  void _alSeleccionarMenu(String opcion) {
    if (opcion == 'nombre') {
      setState(() => _productos.sort((a, b) => a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase())));
    } else if (opcion == 'precio') {
      setState(() => _productos.sort((a, b) => a.precio.compareTo(b.precio)));
    } else if (opcion == 'acerca') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Acerca de'),
          content: const Text(
            'ElectroÁguilas · Tienda de informática y electrónica.\n\n'
            'Proyecto Sprint 1 · UT2 · PMDM 2.º DAM.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _abrirFormularioNuevoProducto() async {
    final nuevo = await Navigator.push<Producto>(
      context,
      MaterialPageRoute(builder: (context) => const NuevoProductoScreen()),
    );

    if (nuevo != null && mounted) {
      setState(() => _productos.add(nuevo));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Producto "${nuevo.nombre}" añadido al catálogo')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ElectroÁguilas'),
        actions: [
          PopupMenuButton<String>(
            onSelected: _alSeleccionarMenu,
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'nombre', child: Text('Ordenar por nombre')),
              PopupMenuItem(value: 'precio', child: Text('Ordenar por precio')),
              PopupMenuDivider(),
              PopupMenuItem(value: 'acerca', child: Text('Acerca de')),
            ],
          ),
        ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirFormularioNuevoProducto,
        child: const Icon(Icons.add),
      ),
    );
  }
}
