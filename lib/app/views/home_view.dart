import 'package:flutter/material.dart';
import 'package:rev_final/app/stores/auth_store.dart';
import 'package:rev_final/domain/user/user.dart';
import 'package:rev_final/domain/user/user_repository.dart';

import '../../locator.dart';
import '../constants/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: FutureBuilder<User>(
          future: i<UserRepository>().user,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            final user = snapshot.data!;

            return SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dados do Usuário',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Nome: ${user.name}'),
                  Text('CPF: ${user.cpf}'),
                  Text('Email: ${user.email}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      AuthWidget.of(context).logout();
                      Navigator.of(context).pushReplacementNamed(Routes.login);
                    },
                    child: const Text('Sair'),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
