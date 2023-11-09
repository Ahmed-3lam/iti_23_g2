import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:iti_23_g2/ecommerce/login/cubit/login_cubit.dart';
import 'package:iti_23_g2/ecommerce/login/widgets/custom_text_field.dart';
import 'package:iti_23_g2/ecommerce/sign_up/sign_up_screen.dart';
import 'package:iti_23_g2/language_cubit/language_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.read<LanguageCubit>().changeLanguage();
            },
            icon: const Icon(
              Icons.language,
              color: Colors.green,
            )),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          right: 40,
          left: 40,
          top: 100,
          bottom: 20,
        ),
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 120,
                      width: 120,
                      child: Image.asset("assets/images/logo3.png")),
                  SizedBox(
                    height: height * .02,
                  ),
                  const Text(
                    "Welcome to our",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    "E-Grocery",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  CustomTextField(
                      height: height,
                      text: "Email",
                      controller: _emailController,
                      validator: (value) {
                        // if (!value!.isValidEmail) {
                        //   return "Email didn't match";
                        // }
                        // if (value.isEmpty) {
                        //   return "The Field is empty";
                        // } else if (value.length < 11) {
                        //   return "the numbers in less than 11 digits";
                        // }

                        setState(() {});
                        return null;
                      }),
                  SizedBox(
                    height: height * .05,
                  ),
                  CustomTextField(
                      height: height,
                      text: "Password",
                      controller: _passwordController,
                      isPassword: _obscureText),
                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.forget_password,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                          }
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(16),
                          elevation: 10,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(16)),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.login,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account?"),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(const SignUpScreen());
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
