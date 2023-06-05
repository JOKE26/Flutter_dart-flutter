import 'dart:async';
import 'dart:developer';

import 'package:appcours/models/meme.dart';
import 'package:appcours/providers/meme_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ddélai avant la redirection vers l'écran d'authentification
    Timer(Duration(seconds: 5), () => context.replaceNamed('auth'));

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/etreinte.png'),
          ],
        ),
      ),
    );
  }
}
