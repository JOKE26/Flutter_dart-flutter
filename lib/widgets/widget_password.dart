import 'dart:developer';

import 'package:appcours/controllers/password_widget_controller.dart';
import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {
  // propriété possédant un comportement d'état lorsque la fonction setState est utilisée
  bool obscurText = true;
  int typeLength = 0;

  PasswordWidget({super.key});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  // appel de l'état
                  // widget permet d'accéder à la classe du widget à partir de la classe de
                  obscureText: widget.obscurText,
                  decoration: InputDecoration(
                    label: Text('Saisir un mot de passe'),
                  ),
                  onChanged: (String value) {
                    // inspect(value);
                    // modifier l'état
                    setState(() {
                      widget.typeLength = value.length;
                    });
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  // setState permet de modifier la valeur d'un état
                  setState(() {
                    //widget.obscurText = !widget.obscurText;
                    widget.obscurText =
                        PasswordWidgetController.getObscure(widget.obscurText);
                  });
                },
                icon: PasswordWidgetController.getIcon(widget.obscurText),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text('${widget.typeLength} caractères saisis'),
          SizedBox(
            height: 15,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 150,
            height: 5,
            decoration: BoxDecoration(
              color: PasswordWidgetController.getColor(widget.typeLength),
            ),
          ),
        ],
      ),
    );
  }
}
