import 'package:flutter/material.dart';

import '../models/producto.dart';

class NuevoProductoScreen extends StatefulWidget {
  const NuevoProductoScreen({super.key});

  @override
  State<NuevoProductoScreen> createState() => _NuevoProductoScreenState();
}

class _NuevoProductoScreenState extends State<NuevoProductoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreCtrl = TextEditingController();
  final _categoriaCtrl = TextEditingController();
  final _precioCtrl = TextEditingController();
  final _descripcionCtrl = TextEditingController();

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _categoriaCtrl.dispose();
    _precioCtrl.dispose();
    _descripcionCtrl.dispose();
    super.dispose();
  }

  String? _validarTexto(String? valor) {
    if (valor == null || valor.trim().isEmpty) return 'Campo obligatorio';
    return null;
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    final nuevoProducto = Producto(
      id: DateTime.now().millisecondsSinceEpoch,
      nombre: _nombreCtrl.text.trim(),
      categoria: _categoriaCtrl.text.trim(),
      precio: double.parse(_precioCtrl.text.trim().replaceAll(',', '.')),
      descripcion: _descripcionCtrl.text.trim(),
    );

    Navigator.pop(context, nuevoProducto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo componente')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nombreCtrl,
              decoration: const InputDecoration(
                labelText: 'Nombre del producto',
                hintText: 'Ej. Tarjeta gráfica RTX 4060',
                border: OutlineInputBorder(),
              ),
              validator: _validarTexto,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _categoriaCtrl,
              decoration: const InputDecoration(
                labelText: 'Categoría',
                hintText: 'Ej. Informática, Placas, Componentes, Cables',
                border: OutlineInputBorder(),
              ),
              validator: _validarTexto,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _precioCtrl,
              decoration: const InputDecoration(
                labelText: 'Precio (€)',
                hintText: 'Ej. 49.90',
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (valor) {
                final numero = double.tryParse(valor?.trim().replaceAll(',', '.') ?? '');
                if (numero == null || numero <= 0) {
                  return 'Introduce un número válido mayor que 0';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descripcionCtrl,
              decoration: const InputDecoration(
                labelText: 'Descripción',
                hintText: 'Ej. Componente electrónico o de hardware para PC',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: _validarTexto,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _guardar,
              icon: const Icon(Icons.save),
              label: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
