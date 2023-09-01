import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iti_23_g2/ecommerce/login/widgets/custom_text_field.dart';
import 'package:iti_23_g2/ecommerce/sign_up/sign_up_screen.dart';
import 'package:iti_23_g2/string_extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
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
                  Text(
                    "Welcome to our",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
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

                  CustomTextField(height: height,
                      text: "Email",
                      controller: _emailController, validator: (value) {
                    if (value!.isValidEmail) {
                      return "Email didn't match";
                    }
                    if (value.isEmpty) {
                      return "The Field is empty";
                    } else if (value.length < 11) {
                      return "the numbers in less than 11 digits";
                    }

                    setState(() {

                    });
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
                    height: height * .05,
                  ),
                  CustomTextField(
                      height: height,
                      text: "Confirm Password",
                      controller: _passwordController2,
                      isPassword: _obscureText),
                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forget Password?"),
                    ],
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {}
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
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have account?"),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(SignUpScreen());
                        },
                        child: Text(
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

  Widget _buildTextField({
    required double height,
    required String text,
    String? Function(String?)? validator,
    required TextEditingController controller,
    bool? isPassword,
  }) {
    print("is password (1): " + isPassword.toString());
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * .01,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: isPassword ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: EdgeInsets.all(12),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: isPassword != null
                ? InkWell(
                    onTap: () {
                      isPassword = !isPassword!;
                      print("===============isPassword: " +
                          isPassword.toString());
                      setState(() {});
                    },
                    child: Icon(isPassword
                        ? CupertinoIcons.eye_fill
                        : CupertinoIcons.eye_slash_fill),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
