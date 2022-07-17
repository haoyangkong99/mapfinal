import 'package:finalexam/loginViewModel.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class LoginScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const LoginScreen());
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Please sign in',
                        style: TextStyle(fontSize: 35.0)),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          hintText: 'Type your email here'),
                      onTap: () {},
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Type your password',
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                        child: const Text('Sign in'),
                        onPressed: () {
                          model.login(_usernameController.text,
                              _passwordController.text);
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
