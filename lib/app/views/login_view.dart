import 'package:flutter/material.dart';
import 'package:rev_final/domain/auth/auth_exception.dart';
import 'package:rev_final/domain/auth/credentials.dart';

import '../constants/routes.dart';
import '../stores/auth_store.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  late final NavigatorState _navigator;

  String cpf = '';
  String password = '';

  String? errorMessage;

  void submit() async {
    try {
      if (_formKey.currentState?.validate() ?? false) {
        _formKey.currentState!.save();
        await AuthWidget.of(context)
            .login(Credentials(cpf: cpf, password: password));
        _navigator.pushReplacementNamed(Routes.home);
      }
    } on UserNotFoundException {
      setState(() => errorMessage = 'Usuário não encontrado');
    } on InvalidCredentialsException {
      setState(() => errorMessage = 'Credenciais inválidas');
    }
  }

  @override
  void initState() {
    super.initState();
    _navigator = Navigator.of(context);
  }

  @override
  void dispose() {
    _navigator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.flutter_dash,
                color: Colors.greenAccent,
                size: 64.0,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'CPF',
                ),
                initialValue: cpf,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'CPF inválido';
                  }
                  return null;
                },
                onSaved: (value) => cpf = value!,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Senha',
                ),
                initialValue: password,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Senha inválida';
                  }
                  return null;
                },
                onSaved: (value) => password = value!,
              ),
              Visibility(
                visible: errorMessage != null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    errorMessage ?? '',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: submit,
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
