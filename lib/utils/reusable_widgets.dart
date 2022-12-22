import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class textEmail extends StatefulWidget {
  const textEmail({super.key});

  @override
  State<textEmail> createState() => _textEmailState();
}

class _textEmailState extends State<textEmail> {
  TextEditingController textEditingController = TextEditingController();

  String email = '';

  bool isEmailCorrcet = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      showCursor: true,
      onChanged: (value) {
        email = value;
        setState(() {
          isEmailCorrcet = isEmail(value);
        });
      },

      // keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isEmailCorrcet == false
                      ? Colors.red.shade200
                      : Colors.green.shade200,
                  width: 2),
              borderRadius: BorderRadius.circular(15.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
              borderRadius: BorderRadius.circular(15.0)),
          // border: InputBorder.none,
          hintText: 'Jonh@gmail.com',
          labelStyle: TextStyle(fontSize: 13, color: Color(0xFF9BA2B1))),
      validator: (value) {
        if (isEmailCorrcet == false) {
          if (value == null || value.isEmpty) {
            return 'le champ ne doit pas etre vide';
          }
          return 'verifiez l\'ecriture de votre email';
        }
        return null;
      },
    );
  }
}
