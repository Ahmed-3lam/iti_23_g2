import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
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
                Row(
                  children: [
                    Text(
                      "Email",
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
                  controller: _emailController,
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value ?? "");
                    if (emailValid == false) {
                      return "Email didn't match";
                    }

                    if (value!.isEmpty) {
                      return "The Field is empty";
                    } else if (value!.length < 11) {
                      return "the numbers in less than 11 digits";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                Row(
                  children: [
                    Text(
                      "Password",
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
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Password can't be less than 6 digits";
                    }
                    return null;
                  },
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    suffixIcon: InkWell(
                      onTap: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      },
                      child: Icon(_obscureText
                          ? CupertinoIcons.eye_fill
                          : CupertinoIcons.eye_slash_fill),
                    ),
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
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
                    _formKey.currentState!.validate();
                    print();
                    print(_passwordControlle_emailController.textr.text);

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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
