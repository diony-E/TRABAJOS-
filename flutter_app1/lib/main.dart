import 'package:flutter/material.dart';

void main() {
  runApp(RegistroApp());
}

class RegistroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de Nombres',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: PaginaRegistro(),
    );
  }
}

class PaginaRegistro extends StatefulWidget {
  @override
  _PaginaRegistroState createState() => _PaginaRegistroState();
}

class _PaginaRegistroState extends State<PaginaRegistro> {
  final TextEditingController controlador = TextEditingController();
  final List<String> nombres = []; // lista donde guardamos los nombres

  void agregarNombre() {
    final texto = controlador.text.trim();
    if (texto.isNotEmpty) {
      setState(() {
        nombres.add(texto);
        controlador.clear(); // limpiar campo de texto
      });
    }
  }

  void eliminarNombre(int index) {
    setState(() {
      nombres.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Nombres'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controlador,
              decoration: InputDecoration(
                labelText: 'Ingrese un nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: agregarNombre,
              child: const Text('Agregar'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: nombres.isEmpty
                  ? const Text('Aún no hay nombres registrados.')
                  : ListView.builder(
                itemCount: nombres.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(nombres[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => eliminarNombre(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

