import 'dart:developer';
import 'package:appcours/models/user.dart';
import 'package:flutter/material.dart';
import 'package:appcours/services/auth_service.dart';
import 'package:appcours/widgets/appbar_widget.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  // état du formulaire
  final _formKey = GlobalKey<FormState>();

  // stocker la saisie
  Map<String, String> _formType = {
    'username': 'Kminchelle',
    'password': '0lelplR',
  };

  // API d'authentification
  AuthService _authService = AuthService();

  AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Container(
        padding: const EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Form(
          key: widget._formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                initialValue: 'Kminchelle',
                decoration: const InputDecoration(
                  label: Text('Username'),
                ),
                onChanged: (String value) {
                  // stocker la saisie
                  widget._formType['username'] = value;
                },
                validator: (String? value) =>
                    value!.isEmpty ? 'Username error' : null,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: '0lelplR',
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
                onChanged: (String value) {
                  // stocker la saisie
                  widget._formType['password'] = value;
                },
                validator: (String? value) =>
                    value!.isEmpty ? 'Password error' : null,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // si le formulaire est valide
                  if (widget._formKey.currentState!.validate()) {
                    // sauvegarder l'état du formulaire
                    widget._formKey.currentState!.save();
                    // inspect(widget._formType);

                    // appel de l'API d'authentification
                    /* then : accéder aux données de la Future lorsque celle-ci est résolue
                      onError : récupérer l'erreur de la Future
                    */
                    widget._authService
                        .getAuth(widget._formType)
                        .then((User user) => context.replaceNamed('home'))
                        .onError((error, stackTrace) => {
                              // ScaffoldMessenger: message qui s'affiche dans le widget Scaffold
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Credentials error'))),
                            });
                  }
                },
                child: const Text('Connect'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
