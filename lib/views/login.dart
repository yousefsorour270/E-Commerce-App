import 'package:flutter/material.dart';
import 'package:flutter_first_project/core/design/app_image.dart';
import 'package:flutter_first_project/core/logic/helper_methods.dart';
import 'package:flutter_first_project/views/home.dart';
import 'package:flutter_first_project/views/register.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24).copyWith(top: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppImage(
                "Vector.png",
                width: 161,
                height: 150,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "TECO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: "NewRocker",
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 64),
              TextFormField(
                decoration: InputDecoration(labelText: "Phone Number"),
              ),
              SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 24),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {
                    navigateTo(RegisterView());
                  },
                  child: Text("Create New Account"),),
              ),
              SizedBox(height: 24),
              FilledButton(onPressed: () {
                navigateTo(HomeView());
              }, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}