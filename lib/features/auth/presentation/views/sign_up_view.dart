import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/values__managers.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/sign_up_form.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Padding(
        padding: const EdgeInsets.all(AppSize.s20),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamed(context, AppRouter.homeView);
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error ?? "Sign up failed")),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign Up", style: AppStyles.regular1),
                  const SizedBox(height: AppSize.s40),
                  const SignUpForm(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
