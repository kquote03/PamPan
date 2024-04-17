import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pam_pan/page_skeleton.dart';


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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
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
                errorText:
                    _errorMessage.isNotEmpty ? 'Please enter a password' : null,
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
                        builder: (context) => const PageSkeleton()));
                if (_emailController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  setState(() {
                    _errorMessage = 'Please enter all fields';
                  });
                } else {
                  setState(() {
                    _errorMessage = '';
                  });

                  // Handle login logic here
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  // For demonstration, just print the email and password
                  _logger.d('Email: $email');
                  _logger.d('Password: $password');

                  // You can add your login logic here, like making API requests
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});
  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  final TextEditingController _fullNameController = TextEditingController();
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              const SizedBox(height: 10),
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
                  // Validate inputs
                  if (_fullNameController.text.isEmpty ||
                      _emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    setState(() {
                      _errorMessage = 'Please enter all fields';
                    });
                  } else {
                    // Clear error message
                    setState(() {
                      _errorMessage = '';
                    });

                    // Handle signup logic here
                    String fullName = _fullNameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    // Log full name, email, and password
                    _logger.d('Full Name: $fullName');
                    _logger.d('Email: $email');
                    _logger.d('Password: $password');

                    // You can add your signup logic here, like making API requests
                  }
                },
                child: const Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}