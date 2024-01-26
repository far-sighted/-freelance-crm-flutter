import 'package:crm/dao/user-login.dart';
import 'package:crm/screen/districts.dart';
import 'package:flutter/material.dart';
import 'package:crm/widget/input.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;

  final key = GlobalKey<FormState>();
  var userLogin = UserLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign in to your Account",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    "Enter your details below to continue.",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(24.0),
              color: Theme.of(context).colorScheme.background,
              child: Form(
                key: key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: <Widget>[
                    Input(
                      animatedLabel: "Email",
                      placeholder: 'Enter your email',
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      onSaved: (String? value) => userLogin.setEmail = value!,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 18.0)),
                    Input(
                      animatedLabel: "Password",
                      placeholder: 'Enter your password',
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      isPassword: true,
                      onSaved: (String? value) =>
                          userLogin.setPassword = value!,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 32.0)),
                    SizedBox(
                      width: double.infinity,
                      height: 48.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            key.currentState!.save();
                            // signInWithCredentials(userLogin);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Districts(),
                              ),
                            );
                          } else {
                            print("error");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          _isLoading ? "loading" : "Sign in",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
