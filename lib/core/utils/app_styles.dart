import 'package:flutter/material.dart';
import 'package:home/core/utils/color_manager.dart';
import 'package:home/core/utils/values__managers.dart';


abstract class AppStyles {
  static const TextStyle styleBold24 = TextStyle(
    color: Color(0xFF1B4965),
    fontSize: 24,
    fontFamily: 'Alef',
    fontWeight: FontWeight.w700,
  );

  static TextStyle subText = TextStyle(
    color: ColorManager.white,
    fontSize: AppSize.s16,
    fontFamily: 'Alef',
    fontWeight: FontWeight.w700,
  );
  static TextStyle regular1 = TextStyle(
    color: ColorManager.white,
    fontSize: AppSize.s32,
    fontFamily: 'Alef',
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleSemiBold24 = TextStyle(
    color: ColorManager.primary,
    fontSize: AppSize.s24,
    fontFamily: 'Alef',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle styleBold = TextStyle(
    color: Color(0xFF1B4965),
    fontSize: AppSize.s24,
    fontFamily: 'Alef',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle styleRegular16 = TextStyle(
    color: Color(0xFF2B2B2B),
    fontSize: AppSize.s16,
    fontFamily: 'ABeeZee',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle styleRegular13 = TextStyle(
    color: Color(0xFF656565),
    fontSize: 13,
    fontFamily: 'ABeeZee',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle styleRegular24 = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: 'ABeeZee',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle styleSemiBold14 = TextStyle(
    color: Color(0xFF656565),
    fontSize: 14,
    fontFamily: 'ABeeZee',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle styleBold14 = TextStyle(
    color: Color(0xFF656565),
    fontSize: 14,
    fontFamily: 'ABeeZee',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle styleBold16 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'ABeeZee',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle styleSemiBold16 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'ABeeZee',
    fontWeight: FontWeight.w600,
  );
}


// import 'package:flutter/material.dart';
// import '../features/home/presentation/views/home_view.dart';
// import '../features/login/presentation/views/forgot_password_view.dart';
// import '../features/login/presentation/views/login_view.dart';
// import '../features/login/presentation/views/logo_view.dart';
// import '../features/login/presentation/views/sign_up_view.dart';

// class AppRoutes {
//   static const String logoView = "/";
//   static const String loginView = "/login";
//   static const String signUpView = "/signup";
//   static const String homeView = "/home";
//   static const String forgotPasswordView = '/forgotPassword';
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case logoView:
//         return MaterialPageRoute(builder: (_) => LogoView());
//       case loginView:
//         return MaterialPageRoute(builder: (_) => LoginView());
//       case signUpView:
//         return MaterialPageRoute(builder: (_) => SignUpView());
//       case homeView:
//         return MaterialPageRoute(builder: (_) => HomeView());
//       case forgotPasswordView:
//         return MaterialPageRoute(builder: (_) => ForgotPasswordView());
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(body: Center(child: Text("No Route Found"))),
//         );
//     }
//   }
// }
