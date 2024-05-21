import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pam_pan/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  String _errorMessage = '';
  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _errorMessage.isNotEmpty
                      ? 'Please enter a valid email'
                      : null,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _errorMessage.isNotEmpty
                      ? 'Please enter a password'
                      : null,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_passwordVisible,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    setState(() {
                      _errorMessage = 'Please enter all fields';
                    });
                  } else {
                    setState(() {
                      _errorMessage = '';
                    });

                    // Handle LoginPage logic here
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    // For demonstration, just print the email and password
                    _logger.d('Email: $email');
                    _logger.d('Password: $password');

                    // You can add your LoginPage logic here, like making API requests
                  }
                },
                child: const Text('LoginPage'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
