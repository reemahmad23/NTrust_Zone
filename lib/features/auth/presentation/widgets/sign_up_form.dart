import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/custom_text_field.dart';
import '../../../../core/utils/values__managers.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart' show AuthLoading, AuthState;

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final disabilityTypeController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final List<Map<String, dynamic>> disabilityTypes = [
    {"id": 1, "name": "Hearing Impairment"},
    {"id": 2, "name": "Visual Impairment"},
    {"id": 3, "name": "Mobility Impairment"},
    {"id": 4, "name": "Cognitive Impairment"},
    {"id": 5, "name": "Speech Impairment"},
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        final currentYear = DateTime.now().year;
        ageController.text = (currentYear - picked.year).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: usernameController,
            labelText: "Username",
            validator:
                (value) =>
            value == null || value.isEmpty
                ? "Enter your username"
                : null,
          ),
          const SizedBox(height: AppSize.s20),
          CustomTextField(
            controller: emailController,
            labelText: "Email",
            validator: (value) {
              if (value == null || value.isEmpty) return "Enter your email";
              final regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
              return !regex.hasMatch(value) ? "Enter a valid email" : null;
            },
          ),
          const SizedBox(height: AppSize.s20),
          CustomTextField(
            controller: ageController,
            labelText: "Age",
            readOnly: true,
            validator:
                (value) =>
            value == null || value.isEmpty
                ? "Select your birthdate"
                : null,
            suffixIcon: GestureDetector(
              onTap: () => _selectDate(context),
              child: Icon(Icons.calendar_today, color: ColorManager.white),
            ),
          ),
          const SizedBox(height: AppSize.s20),
          DropdownButtonFormField<int>(
            decoration: InputDecoration(
              labelText: "Disability Type",
              filled: true,
              fillColor: ColorManager.white,
              labelStyle:  TextStyle(color: ColorManager.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              suffixIcon:  Icon(Icons.arrow_drop_down, color: ColorManager.primary),
            ),
            style: const TextStyle(color: Colors.black),
            dropdownColor: ColorManager.darkGrey,
            iconEnabledColor: Colors.white,
            value: disabilityTypeController.text.isEmpty
                ? null
                : int.tryParse(disabilityTypeController.text),
            onChanged: (int? newValue) {
              setState(() {
                disabilityTypeController.text = newValue.toString();
              });
            },
            validator: (value) =>
            value == null ? "Please select a disability type" : null,
            items: disabilityTypes.map((type) {
              return DropdownMenuItem<int>(
                value: type['id'],
                child: Text(type['name']),
              );
            }).toList(),
          ),

          const SizedBox(height: AppSize.s20),
          CustomTextField(
            controller: passwordController,
            labelText: "Password",
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter your password";
              }
              if (value.length < 6) {
                return "Password must be at least 6 characters";
              }
              if (!RegExp(r'[A-Z]').hasMatch(value)) {
                return "Must contain at least one uppercase letter";
              }
              if (!RegExp(r'[a-z]').hasMatch(value)) {
                return "Must contain at least one lowercase letter";
              }
              if (!RegExp(r'[0-9]').hasMatch(value)) {
                return "Must contain at least one number";
              }
              if (!RegExp(
                r'[!@#\$&*~%^()_\-+=<>?/\\.,;:{}[\]|]',
              ).hasMatch(value)) {
                return "Must contain at least one special character";
              }
              return null;
            },
          ),
          const SizedBox(height: AppSize.s20),
          CustomTextField(
            controller: confirmPasswordController,
            labelText: "Confirm Password",
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Confirm your password";
              }
              if (value != passwordController.text) {
                return "Passwords do not match";
              }
              return null;
            },
          ),
          const SizedBox(height: AppSize.s20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account? ", style: AppStyles.subText),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, AppRouter.loginView),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: ColorManager.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSize.s20),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return state is AuthLoading
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                label: "Sign Up",
                onPressedAction: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().signUp(
                      username: usernameController.text,
                      email: emailController.text,
                      age: ageController.text,
                      disabilityType: disabilityTypeController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text, context: context,
                    );
                  }
                },
                backgroundColor: ColorManager.mintGreen,
                textColor: ColorManager.black,
              );
            },
          ),
        ],
      ),
    );
  }
}
