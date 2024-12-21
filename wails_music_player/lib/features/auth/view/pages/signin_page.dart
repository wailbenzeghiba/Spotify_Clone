import 'package:flutter/material.dart';
import 'package:wails_music_player/core/theme/app_pallette.dart';
import 'package:wails_music_player/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:wails_music_player/features/auth/view/widgets/custom_field.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  State<Signin> createState() => _SigninState();
}

@override
class _SigninState extends State<Signin> {
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
    formkey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In.",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
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
                buttonLabel: 'Sign In',
                ontap: () {},
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
                        text: "Don't have an account?",
                        children: const [
                      TextSpan(
                          text: '  Sign Up',
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
    );
  }
}
