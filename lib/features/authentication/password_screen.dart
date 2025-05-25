import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthDayScreen(),
      ),
    );
  }
  // 패스워드 조건 확인
  bool _isPasswordValid() {
    return _password8to20() && _passwordHas3DifferentLetters();
  }
  // 포커스 없어졌을때
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }
  // 비밀번호 지워버리기
  void _onClearTap() {
    _passwordController.clear();
  }

  bool _obscureText = true;

  // 비밀번호 보여주기
  void _onShowPassword() {
    _obscureText = !_obscureText;
    setState(() {});
  }
  // 비밀번호 8~20자리인지 확인
  bool _password8to20(){
    return _password.length >=8 && _password.length <=20;
  }
  // 비밀번호 특수문자 1개 이상 알파벳 1개 이상 숫자 1개 이상인지 확인
  bool _passwordHas3DifferentLetters(){
    bool isAlpha = RegExp(r'[A-Za-z]').hasMatch(_password);
    bool isSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(_password);
    bool isNumber = RegExp(r'[0-9]').hasMatch(_password);
    if(!isAlpha || !isSpecial || !isNumber)return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Sign up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              Text(
                "What is your Password?",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,
                onEditingComplete: _onSubmit,
                obscureText: _obscureText,
                autocorrect: false,
                // 자동완성 끄기
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h14,
                      GestureDetector(
                        onTap: _onShowPassword,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v10,
              const Text(
                "your password must have:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                      FontAwesomeIcons.circleCheck,
                      size:Sizes.size20,
                      color :_password8to20()
                          ? Colors.green
                          : Colors.grey.shade400
                  ),
                  Gaps.h5,
                  const Text("8 to 20 characters"),
                ],
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                      FontAwesomeIcons.circleCheck,
                      size:Sizes.size20,
                      color :_passwordHas3DifferentLetters()
                          ? Colors.green
                          : Colors.grey.shade400
                  ),
                  Gaps.h5,
                  const Text("Letters, numbers,and special characters"),
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: !_isPasswordValid(),
                    buttonText : "Next",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
