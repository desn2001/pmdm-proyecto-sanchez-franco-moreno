# Electro Águilas

**Comercio:** Electro Águilas, venta de componentes electrónicos (inventado)
**Equipo:** Diego Esteban Sánchez Navarro · Antonio Franco Blazquez · Alejandro Moreno
**Módulo:** PMDM · 2.º DAM · Sprint 1 (UT2)

## Cómo ejecutar la app

```
flutter pub get
flutter run
```

## Productos o servicios (al menos 8)

| id | Nombre | Descripción | Precio (€) | Categoría |
|----|--------|-------------|-----------|------------|
| 1 | Arduino Uno R3 | Placa de desarrollo para proyectos electrónicos. | 24,90 | Placas |
| 2 | Raspberry Pi 5 | Pequeño ordenador para proyectos tecnológicos. | 79,90 | Placas |
| 3 | Resistencia 220 Ohm | Resistencia electrónica de 220 ohmios. | 0,10 | Componentes |
| 4 | LED rojo | Diodo LED de color rojo. | 0,25 | Componentes |
| 5 | Protoboard | Placa para realizar montajes electrónicos. | 6,50 | Accesorios |
| 6 | Cable USB-C | Cable USB tipo C para carga y transferencia. | 4,90 | Cables |
| 7 | Memoria RAM 8 GB | Módulo de memoria RAM de 8 GB. | 29,90 | Informática |
| 8 | Fuente de alimentación 500W | Fuente de alimentación para ordenador. | 39,90 | Informática |

## Estructura y clases

| Clase | Carpeta | Hereda de | Qué hace | Autor/a |
|-------|---------|-----------|----------|---------|
| ComercioApp | main.dart | StatelessWidget | Raíz de la app: tema y pantalla inicial | Diego |
| Producto | models | — | Guarda los datos de un producto | Diego |
| productosEjemplo | data | — | Lista constante con los 8 productos del comercio | Diego |
| CatalogoScreen | screens | StatefulWidget | Muestra la lista de productos; al mantener pulsado pide confirmación para borrar | Diego |
| ProductoTile | widgets | StatelessWidget | Fila de la lista: nombre, categoría y precio | Diego |
| DetalleScreen | screens | StatelessWidget | Muestra nombre, categoría, descripción y precio de un producto | Antonio |
| NuevoProductoScreen | screens | StatefulWidget | Formulario de alta de producto con validación  | Alejandro |

## Reparto del trabajo

| Persona | Tareas del sprint 1 | Rama |
|---------|---------------------|------|
| Diego | Datos, lista y fila | catalogo |
| Antonio | Detalle y alerta de borrado | detalle |
| Alejandro | Formulario y menú | formulario-menu |

## Pruebas de interacción (dos emuladores)

| # | Prueba | Teléfono API 28 | Tableta API 36 |
|---|--------|-----------------|----------------|
| 1 | Todas las pantallas se abren y vuelven con la flecha y con el botón atrás | Sí | Sí |
| 2 | Una lista con muchos elementos se desplaza sin saltos | Si | Si |
| 3 | Un texto muy largo no rompe la fila ni se sale de pantalla | Si | Si |
| 4 | El formulario rechaza valores vacíos y números no válidos | Si | Si |
| 5 | Con el teclado abierto se ve el botón de guardar | Si | Si |
| 6 | Al girar la pantalla no se pierde lo escrito ni la posición de la lista | Si | Si |
| 7 | Los favoritos marcados en el detalle se ven en el catálogo al volver | No | No |
| 8 | Tras pulsar Inicio y volver, la app está donde estaba | Si | Si |
| 9 | En la tableta la interfaz aprovecha el ancho o al menos no queda rota | Si | Si |
| 10 | No hay errores rojos en la consola de depuración | Sin fallos | Sin fallos |
- Las pruebas que ponen Si quiere decir que las pruebas estan hechas y comprobadas en los dispositivos que ponen Si.

## Incidencias

| Qué pasa | Dispositivo | Solución o estado | Issue |
|----------|-------------|-------------------|-------|
| No esta implentada el boton para favorito | En ninguno | Para implementar, implementar el boton de favorito y actualizar el esta de nuestro producto | |

## Declaración del uso de IA

- Parte A (Diego): Se ha usado IA para que explique cómo mejorar el aspecto visual del catálogo.
- Parte B (Antonio): Se ha usado la IA para apoyo para entender el proyecto, sumado con el proyecto de prueba.
- Parte C (Alejandro): Apoyo de la IA para ubicación y ayuda para el desarrollo del mismo.
- README: se ha usado IA para dar formato a las tablas de Markdown y revisar la tabla de clases.
