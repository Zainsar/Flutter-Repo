import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_assignment/main.dart';
import 'package:form_field_validator/form_field_validator.dart'; // Import main screen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Enter a valid email address')
  ]);
  final passwordValidator = RequiredValidator(errorText: 'Password is required');

  bool _isPasswordVisible = false; // Variable to control password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Email Input
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => _email = value,
                validator: emailValidator.call,
              ),
              SizedBox(height: 16),

              // Password Input with Eye Icon
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: _isPasswordVisible ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible; // Toggle the password visibility
                      });
                    },
                  ),
                ),
                obscureText: !_isPasswordVisible, // Toggle visibility of the password
                onChanged: (value) => _password = value,
                validator: passwordValidator.call,
              ),
              SizedBox(height: 16),

              // Login Button
              ElevatedButton(
                onPressed: _handleLogin,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Login user using email and password
        await _auth.signInWithEmailAndPassword(email: _email, password: _password);

        // If login is successful, navigate to the main screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyApp()),  // Go to Main Screen
        );

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully logged in!')));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      }
    }
  }
}
