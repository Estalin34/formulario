import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registra extends StatelessWidget {
  const Registra({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro"),
      ),
      body: const RegistroForm(),
    );
  }
}

class RegistroForm extends StatefulWidget {
  const RegistroForm({super.key});

  @override
  State<RegistroForm> createState() => _RegistroFormState();
}

class _RegistroFormState extends State<RegistroForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> registrarUsuario(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuario registrado exitosamente")),
      );
      Navigator.pop(context); // Regresa a la pantalla anterior
    } on FirebaseAuthException catch (e) {
      String mensajeError = "Ocurrió un error";
      if (e.code == 'email-already-in-use') {
        mensajeError = "El correo ya está en uso.";
      } else if (e.code == 'weak-password') {
        mensajeError = "La contraseña es muy débil.";
      } else if (e.code == 'invalid-email') {
        mensajeError = "El correo no es válido.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensajeError)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: "Correo",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Contraseña",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => registrarUsuario(
              emailController.text,
              passwordController.text,
            ),
            icon: const Icon(Icons.app_registration),
            label: const Text("Registrarse"),
          ),
        ],
      ),
    );
  }
}
