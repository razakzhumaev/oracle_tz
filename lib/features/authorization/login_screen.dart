import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_tz/internal/components/app_routes.dart';
import 'package:oracle_tz/internal/helpers/snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> login() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('email', emailTextInputController.text.trim());
      // prefs.setString('password', passwordTextInputController.text.trim());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        SnackBarService.showSnackBar(
          context,
          'Неправильный email или пароль. Повторите попытку',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
        return;
      }
    }
    context.go(RouterConstants.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          top: 33.h,
          left: 16.w,
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Log in',
                style: TextStyle(
                  fontSize: 36.sp,
                ),
              ),
              SizedBox(height: 32.h),
              SizedBox(
                height: 52.h,
                width: 343.w,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  controller: emailTextInputController,
                  validator: (email) {
                    email != null && !EmailValidator.validate(email)
                        ? 'Введите правильный Email'
                        : null;
                    return null;
                  },
                  style: const TextStyle(
                    decorationColor: Colors.green,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_2_outlined,
                      color: Colors.grey,
                    ),
                    hintText: 'Email',
                    // hintStyle: TextHelper.w300,
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 52.h,
                width: 343.w,
                child: TextFormField(
                  autocorrect: false,
                  controller: passwordTextInputController,
                  obscureText: isHiddenPassword,
                  validator: (value) {
                    value != null && value.length < 6
                        ? 'Минимум 6 символов'
                        : null;
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    suffix: InkWell(
                      onTap: togglePasswordView,
                      child: Icon(
                        isHiddenPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'Пароль',
                    // hintStyle: TextHelper.w300,
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              InkWell(
                onTap: login,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: Colors.black,
                      width: 3.sp,
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 52.h,
                  width: 343.w,
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}