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
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: widget.passwordController,
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              Text(errorMessage),
              SizedBox(height: 20),
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
                    ;
                  }
                },
                child: Text(
                    creatingAccount == false ? 'Logowanie' : 'Rejestracja'),
              ),
              SizedBox(height: 20),
              if (creatingAccount == false) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      creatingAccount = true;
                    });
                  },
                  child: Text('Utwórz konto'),
                ),
              ],
              if (creatingAccount == true) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      creatingAccount = false;
                    });
                  },
                  child: Text('Masz już konto?'),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
