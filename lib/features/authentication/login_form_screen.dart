import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginRomScreenState();
}

class _LoginRomScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formDate = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) => const InterestsScreen(),
        ),
            (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                    decoration: const InputDecoration(hintText: "Email"),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Please write your email";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formDate['email'] = newValue;
                      }
                    }),
                Gaps.v16,
                TextFormField(
                  decoration: const InputDecoration(hintText: "Password"),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Please write your password";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formDate['password'] = newValue;
                    }
                  },
                ),
                Gaps.v28,
                GestureDetector(
                    onTap: _onSubmitTap,
                    child:
                        const FormButton(disabled: false, buttonText: "Login"))
              ],
            )),
      ),
    );
  }
}
