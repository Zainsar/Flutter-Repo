import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'login_screen.dart';  // Import Login Screen

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _phoneNo = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final nameValidator = RequiredValidator(errorText: 'Name is required');
  final emailValidator = MultiValidator([RequiredValidator(errorText: 'Email is required'), EmailValidator(errorText: 'Enter a valid email address')]);
  final passwordValidator = RequiredValidator(errorText: 'Password is required');
  final phoneValidator = MultiValidator([RequiredValidator(errorText: 'Phone number is required'), MinLengthValidator(10, errorText: 'Enter a valid phone number')]);

  bool _isPasswordVisible = false; // Variable to control password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Name Input
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) => _name = value,
                validator: nameValidator.call,
              ),
              SizedBox(height: 16),

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
                obscureText: !_isPasswordVisible, // Toggle the visibility of the password
                onChanged: (value) => _password = value,
                validator: passwordValidator.call,
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
              ),
              SizedBox(height: 16),

              // Phone Number Input
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                onChanged: (value) => _phoneNo = value,
                validator: phoneValidator.call,
              ),
              SizedBox(height: 16),

              // Sign Up Button
              ElevatedButton(
                onPressed: _handleSignUp,
                child: Text('Sign Up'),
              ),
              SizedBox(height: 16),

              // Go to Login Page
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()), // Navigate to Login
                  );
                },
                child: Text("Already have an account? Log in"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Create user using email and password
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        // Store additional information (Name, Phone Number) in Firebase Firestore
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
          'name': _name,
          'phone': _phoneNo,
          'email': _email,
        });

        // Navigate to Login Page after SignUp
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),  // Go to Login
        );

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully signed up!')));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      }
    }
  }
}
