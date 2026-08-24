import 'package:flutter/material.dart';

class LoginFromScreen extends StatefulWidget {
  const LoginFromScreen({super.key});

  @override
  State<LoginFromScreen> createState() => _LoginFromScreenState();
}

class _LoginFromScreenState extends State<LoginFromScreen> {
  bool loggedIn = false;
  String name = '';
  final _nameController = TextEditingController();
  final _mailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget _buildSuccess() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Icon(Icons.check, color: Colors.green, size: 100),
      Text('Hi $name', style: const TextStyle(fontSize: 50)),
    ]);
  }

  void _vlidate() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      // Form is valid, proceed with login logic
      setState(() {
        loggedIn = true;
        name = _nameController.text;
      });
    }
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Runner"),
              validator: (text) =>
                  text!.isEmpty ? "Please enter your name" : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _mailController,
              decoration: const InputDecoration(labelText: "Runner"),
              validator: (text) {
                if (text!.isEmpty) {
                  return "Please enter your email";
                }
                final regex = RegExp('[^@]+@[^.]+..+');
                if (!regex.hasMatch(text)) {
                  return "Please enter a valid email";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _vlidate,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: loggedIn ? _buildSuccess() : _buildLoginForm(),
      ),
    );
  }
}
