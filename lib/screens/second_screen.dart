import 'dart:developer';

import 'package:appcours/models/meme.dart';
import 'package:appcours/providers/meme_provider.dart';
import 'package:appcours/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // récupération des données stockées dans le provider
    Meme? meme = context.watch<MemeProvider>().meme;

    inspect(meme);

    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(meme!.url!),
            Text(meme!.name!),
            ElevatedButton(
              onPressed: () {
                // pop supprimer l'écran affiché
                context.pop();
              },
              child: Text('HomeZer'),
            ),
          ],
        ),
      ),
    );
  }
}
