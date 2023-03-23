import 'package:flutter/material.dart';
import 'package:phone_log/individual_pages/time_tracking/controller/authController.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xffF6F6F6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          controller: context.read<AuthViewModel>().loginScroll,
          child: Container(
            alignment: Alignment.center,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Image.asset('assets/images/rareCrewLogo.PNG'),
                  const SizedBox(height: 30),
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Sign in to cotinue',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 50),
                  LoginField(
                      hint: 'Username',
                      onTap: () {},
                      keyboardButton: TextInputAction.next,
                      controller: context.read<AuthViewModel>().nameController),
                  const SizedBox(height: 10),
                  LoginField(
                    hint: 'Password',
                    isPassword: context.watch<AuthViewModel>().isVisible,
                    controller:
                        context.read<AuthViewModel>().passwordController,
                    suffix: IconButton(
                        onPressed: () {
                          context.read<AuthViewModel>().toggleVisibilty();
                        },
                        icon: Icon(
                          context.watch<AuthViewModel>().isVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                          size: 28,
                        )),
                  ),
                  const SizedBox(height: 10),
                  MaterialButton(
                    key: context.read<AuthViewModel>().loginButtonKey,
                    height: 65,
                    onPressed: () {},
                    color: Color(0xff14CB43),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.transparent,
                        ),
                        Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 65,
                    decoration: BoxDecoration(border: Border.all()),
                    child: MaterialButton(
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      onPressed: () {},
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 30),
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border(right: BorderSide())),
                              child: Image.asset('assets/images/google.PNG')),
                          Text(
                            'Sign in with Google',
                            style: TextStyle(
                                color: Color(0xff212121), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/vault.PNG'),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style:
                                TextStyle(color: Color.fromRGBO(0, 0, 0, .5)),
                          ))
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

class LoginField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final Widget? suffix;
  final TextInputAction? keyboardButton;
  final VoidCallback? onTap;
  const LoginField({
    super.key,
    required this.hint,
    required this.controller,
    this.suffix,
    this.isPassword = false,
    this.keyboardButton,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 200),
      textInputAction: keyboardButton,
      onTap: onTap,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE7EAEC))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE7EAEC))),
          hintText: hint,
          suffixIcon: suffix,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18)),
    );
  }
}
