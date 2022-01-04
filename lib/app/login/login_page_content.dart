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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Zaloguj Się'),
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
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: widget.emailController.text,
                      password: widget.passwordController.text,
                    );
                  } catch (error) {
                    setState(() {
                      errorMessage = error.toString();
                    });
                    ;
                  }
                },
                child: Text('Zaloguj'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
