
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/values__managers.dart';
import '../cubit/auth_cubit.dart';

class  LogoForm extends StatelessWidget {
  const  LogoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child:
      Column(
        children: [
          SizedBox(height: AppSize.s100),
          CustomButton(
            label: AppStrings.login,
            onPressedAction: () {
              context.read<AuthCubit>().navigateToLogin();
              Navigator.pushNamed(context, AppStrings.loginRoute);
            },
            backgroundColor: ColorManager.mintGreen,
            textColor: ColorManager.black,
            width: AppSize.s150,
            height: AppSize.s50,
            padding: EdgeInsets.fromLTRB(AppSize.s32, AppSize.s16, AppSize.s32, AppSize.s16),
            fontSize: AppSize.s20,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: AppSize.s20),
          CustomButton(
            label: AppStrings.signUp,
            onPressedAction: () {
              print("signUp");
              context.read<AuthCubit>().navigateToSignUp();
              Navigator.pushNamed(context, AppStrings.signUpRoute);
            },
            backgroundColor: ColorManager.mintGreen,
            textColor: ColorManager.black,
            width: AppSize.s150,
            height: AppSize.s50,
            padding: EdgeInsets.fromLTRB(AppSize.s32, AppSize.s16, AppSize.s32, AppSize.s16),
            fontSize: AppSize.s20,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}