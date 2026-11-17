import 'package:flutter/material.dart';

import '../models/producto.dart';

class ProductoTile extends StatelessWidget {
  final Producto producto;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const ProductoTile({
    super.key,
    required this.producto,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const CircleAvatar(child: Icon(Icons.memory)),
        title: Text(
          producto.nombre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(producto.categoria),
        trailing: Text(
          producto.precioTexto,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.green,
          ),
        ),
        onTap: onTap,               
        onLongPress: onLongPress,
      ),
    );
  }
}
