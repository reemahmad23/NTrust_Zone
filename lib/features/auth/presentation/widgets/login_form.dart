import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_zone/core/utils/app_strings.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/custom_text_field.dart';
import '../../../../core/utils/values__managers.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: emailController,
                labelText: AppStrings.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.pleaseEnterYourEmail;
                  }
                  final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!regex.hasMatch(value)) return AppStrings.invalidEmailFormat;
                  return null;
                },
              ),
              const SizedBox(height: AppSize.s20),
              CustomTextField(
                controller: passwordController,
                labelText: AppStrings.password,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.pleaseEnterYourPassword;
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return "Password must contain at least one uppercase letter";
                  }
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return "Password must contain at least one lowercase letter";
                  }
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return "Password must contain at least one number";
                  }
                  if (!RegExp(r'[!@#\$&*~%^()_\-+=<>?/\\.,;:{}[\]|]').hasMatch(value)) {
                    return "Password must contain at least one special character";
                  }
                  return null;
                },
              ),

              const SizedBox(height: AppSize.s10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, AppRouter.forgotPasswordView),
                  child: Text(AppStrings.forgotPassword, style: AppStyles.subText),
                ),
              ),
              const SizedBox(height: AppSize.s20),
              state is AuthLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                label: AppStrings.login,
                onPressedAction: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                backgroundColor: ColorManager.mintGreen,
                textColor: ColorManager.black,
                width: double.infinity,
              ),
              const SizedBox(height: AppSize.s40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.dontHaveAccount, style: AppStyles.subText),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, AppRouter.signUpView),
                    child: Text(AppStrings.signUp, style: AppStyles.subText),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
