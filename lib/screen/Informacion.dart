import 'package:flutter/material.dart';

class Informacion extends StatelessWidget {
  const Informacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Perfil de Usuario",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.blue,
                ),
                title: Text(
                  "Nombre:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Estalin Fuenmayor"),
              ),
            ),
            const Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 40,
                  color: Colors.blue,
                ),
                title: Text(
                  "Correo:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("usuario@ejemplo.com"),
              ),
            ),
            const Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 40,
                  color: Colors.blue,
                ),
                title: Text(
                  "Teléfono:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("+58 123 456 7890"),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.logout),
                label: const Text("Cerrar sesión"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
