import 'package:flutter/material.dart';
import 'package:pam_pan/backend/appwrite_client.dart';
import 'package:pam_pan/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      // Perform login action
      print('Username: ${_usernameController.text}');
      print('Password: ${_passwordController.text}');

      try {
        await account
            .createEmailPasswordSession(
                email: _usernameController.text,
                password: _passwordController.text)
            .timeout(const Duration(seconds: 10));

        var result = await account.get();
        print("Currently signed in as: " + (result?.email ?? "error"));

        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      } catch (e) {
        if (e.toString().contains("user_invalid_credentials")) {
          _showInvalidCredentialDialog(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_showInvalidCredentialDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext builderContext) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 150),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Email or password is invalid, please try again.",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: const Text("Close"))
              ],
            ),
          ),
        ),
      );
    },
  );
}
