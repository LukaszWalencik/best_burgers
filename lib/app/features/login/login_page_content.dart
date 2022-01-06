import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var creatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  creatingAccount == false ? 'Zaloguj Się' : 'Zarejestruj sie'),
              TextField(
                controller: widget.emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: widget.passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Text(errorMessage),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (creatingAccount == true) {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  } else {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  }
                },
                child: Text(
                    creatingAccount == false ? 'Logowanie' : 'Rejestracja'),
              ),
              const SizedBox(height: 20),
              if (creatingAccount == false) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      creatingAccount = true;
                    });
                  },
                  child: const Text('Utwórz konto'),
                ),
              ],
              if (creatingAccount == true) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      creatingAccount = false;
                    });
                  },
                  child: const Text('Masz już konto?'),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
