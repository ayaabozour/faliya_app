import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_up_app/helpers/validators/validator.dart';
import 'package:show_up_app/screens/place_holder.dart';
import 'package:show_up_app/theme/size/app_size.dart';
import 'package:show_up_app/widgets/buttons/primary_button.dart';
import 'package:show_up_app/widgets/input/custom_text_field.dart';

class AttenderLoginScreen extends StatefulWidget {
  const AttenderLoginScreen({super.key});

  @override
  State<AttenderLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AttenderLoginScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.w24,
            vertical: AppSize.h24,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.h),
                Text(
                  'Welcome Back ',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Login to continue discovering amazing events',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 32.h),
                CustomTextField(
                  label: 'Username',
                  controller: usernameController,
                  icon: const Icon(Icons.person_outline),
                  validator: Validator().emptyValidator,
                ),
                SizedBox(height: AppSize.h20),
                CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  isHiddenPassword: true,
                  icon: const Icon(Icons.lock_outline),
                  onEyeTap: () {
                    //TODO: add the logic of the hidden password
                  },
                  validator: Validator().passwordValidator,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                ),
                //TODO: handle this one too
                SizedBox(height: AppSize.h24),
                PrimaryButton(
                  text: 'Login',
                  isLoading: false,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => HomePlaceholderScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: AppSize.h24),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'OR',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: AppSize.h24),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: 'Register',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
