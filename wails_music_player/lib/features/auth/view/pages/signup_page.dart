// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:wails_music_player/core/theme/app_pallette.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:wails_music_player/features/auth/repos/auth_remote_repo.dart';
import 'package:wails_music_player/features/auth/view/pages/signin_page.dart';
import 'package:wails_music_player/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:wails_music_player/features/auth/view/widgets/custom_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
@override
  State<SignUp> createState() => _SignUpState();
}

@override
class _SignUpState extends State<SignUp> {
  final NameController = TextEditingController();
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    NameController.dispose();
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
    formkey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign Up.",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldCustom(
                  hintText: "Name",
                  controller: NameController,
                  isObscureText: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFieldCustom(
                  hintText: "Email",
                  controller: EmailController,
                  isObscureText: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFieldCustom(
                  hintText: "Password",
                  controller: PasswordController,
                  isObscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthGradientButton(
                  buttonLabel: 'Sign Up',
                  ontap: () async {
                   final res = await AuthRemoteRepo().signup(name: NameController.text, email: EmailController.text, password: PasswordController.text);
                   final val = switch (res) {
                   Left(value: final L) => L,
                   Right(value: final R) => R.toString(),
                   };
                   // ignore: avoid_print
                   print(val);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Signin()));
                  },
                  child: RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.titleMedium,
                          text: "Already have an account?",
                          children: const [
                        TextSpan(
                            text: '  Sign in',
                            style: TextStyle(
                                fontSize: 18,
                                color: Pallete.gradient2,
                                fontWeight: FontWeight.w600))
                      ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
