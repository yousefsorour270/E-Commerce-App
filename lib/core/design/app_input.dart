import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final String text;
  final bool isPassword;

  const AppInput({super.key, this.text = "", this.isPassword = false});

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: TextFormField(
        obscureText: widget.isPassword&&isHidden,
        decoration: InputDecoration(
            labelText: widget.text,
            suffixIcon: widget.isPassword
                ? IconButton(
              onPressed: () {
                isHidden = !isHidden;
                setState(() {

                });
              },
              icon: Icon(isHidden?Icons.visibility_off:Icons.visibility),
            )
                : null),
      ),
    );
  }
}