import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firabase/screen/Informacion.dart';
import 'package:firabase/screen/Registra.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi primera app'),
      ),
      body: formularioLogin(context),
    );
  }
}

Widget formularioLogin(BuildContext context) {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Login",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: email,
          decoration: const InputDecoration(
            labelText: "Correo",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: password,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: "Contraseña",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () => Ingresar(email.text, password.text, context),
          icon: const Icon(Icons.login),
          label: const Text("Ingresar"),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Registra()),
            );
          },
          child: const Text("¿No tienes cuenta? Regístrate"),
        ),
      ],
    ),
  );
}

Future<void> Ingresar(String email, String password, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Informacion()),
    );
  } on FirebaseAuthException catch (e) {
    String mensajeError = "Ocurrió un error";
    if (e.code == 'user-not-found') {
      mensajeError = "No se encontró un usuario con ese correo.";
    } else if (e.code == 'wrong-password') {
      mensajeError = "Contraseña incorrecta.";
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensajeError)),
    );
  }
}
