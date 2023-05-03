import 'package:breaking_bad_mvvm/core/widget/custom_button.dart';
import 'package:breaking_bad_mvvm/core/widget/custom_text_form_field.dart';
import 'package:breaking_bad_mvvm/features/characters/presentation/view/widget/location_screen_body.dart';
import 'package:breaking_bad_mvvm/features/home/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

bool isSecure=true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style:
                      TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.emailAddress,
                  nameController: emailController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'email is requre';
                    }
                  },
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.visiblePassword,
                  nameController: passwordController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'password is requre';
                    } else if (v.length < 8) {
                      return 'password more then lentgth 8 characters or equle 8';
                    }
                  },
                  labelText: 'Password',
                  prefixIcon: Icons.lock,
                  suffixIcon:isSecure==true? Icons.remove_red_eye:Icons.visibility_off,
                  obscureText: isSecure,
                  onPressedSuffixIcon: () {
                    setState(() {
                      isSecure==true?isSecure=false:isSecure=true;
                    });
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(
                  nameButton: 'LOGIN',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                                   
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),)) ;    
                                   
                                   },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Register Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




