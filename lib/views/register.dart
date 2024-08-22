import 'package:flutter/material.dart';

import '../../core/design/app_button.dart';
import '../../core/design/app_input.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24).copyWith(top: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Create New Account", style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 24
              ),),
              SizedBox(height: 8),
              Text("Please fill your data below.", style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xff7E7E7E)
              ),),
              SizedBox(height: 24),
              AppInput(text: "Name"),
              AppInput(text: "Phone Number"),
              AppInput(text: "Password",isPassword: true,),
              AppButton(
                text: "Create Account",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}