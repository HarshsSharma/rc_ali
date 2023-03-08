import 'package:flutter/material.dart';
import 'package:phone_log/controller/auth_view_model.dart';
import 'package:phone_log/core/constant/app_assets.dart';
import 'package:phone_log/core/router.dart';
import 'package:provider/provider.dart';

import '../../core/constant/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Image.asset(AppAssets.logo),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 35, bottom: 50),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: AppColors.borderGrey,
                      ),
                    ),
                  ),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                            color: AppColors.borderGrey, fontSize: 18),
                        decoration: const InputDecoration(
                            hintText: 'User Name',
                            hintStyle: TextStyle(
                                color: AppColors.borderGrey, fontSize: 18),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.borderGrey))),
                      ),
                      const SizedBox(height: 20),
                      Consumer<AuthViewModel>(
                        builder: (context, value, child) {
                          return TextFormField(
                            style: const TextStyle(
                                color: AppColors.borderGrey, fontSize: 18),
                            keyboardType: TextInputType.text,
                            obscureText: value.passwordHidden,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  child: Icon(value.passwordHidden
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onTap: () => value.togglePasswordVisibility(),
                                ),
                                suffixIconColor: AppColors.borderGrey,
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                    color: AppColors.borderGrey, fontSize: 18),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.borderGrey))),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouterNames.layout);
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(double.maxFinite, 50),
                              backgroundColor: AppColors.babyBlue),
                          child: Text(
                            'Sign In'.toUpperCase(),
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
