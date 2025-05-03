import 'package:flutter/material.dart';
import 'package:home/core/utils/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:home/core/utils/set_up_service_locator.dart';
void main() async {
   WidgetsFlutterBinding.ensureInitialized(); // مهم
    setupServiceLocator(); 
  runApp(
    DevicePreview(
    enabled: true,
    builder: (context) => const TrustZone(),
  )
  );
}

class TrustZone extends StatelessWidget {
  const TrustZone({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,

    );
  }
}




// import 'package:flutter/material.dart';
// <<<<<<< HEAD
// import 'package:home/core/utils/app_router.dart';
// import 'package:home/core/utils/set_up_service_locator.dart';
// import 'package:device_preview/device_preview.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // مهم
//   setupServiceLocator(); 
//   runApp(
//     DevicePreview(
//     enabled: true,
//     builder: (context) => const TrustZone(),
//   )
//   );
// =======
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trust_zone/core/utils/app_router.dart';
// import 'core/network/dio_helper.dart';
// import 'features/auth/presentation/cubit/auth_cubit.dart';
// import 'features/auth/presentation/views/login_view.dart';
// import 'injection_container.dart' as di;


// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   DioHelper.init();
//   di.init();
//   runApp( NTrustZone());
// >>>>>>> e932821de9ad6fb6de23784583133a1a46030ecb
// }

// class NTrustZone extends StatelessWidget {
//   const NTrustZone({super.key});

//   @override
//   Widget build(BuildContext context) {
// <<<<<<< HEAD
//     return 
//     // MultiBlocProvider(
//     //   providers: [
//     //     // ProfileCubit يتم تحميله باستخدام GetIt
//     //     BlocProvider(
//     //       create: (_) => getIt<ProfileCubit>()..getUserProfile(),
//     //     ),
//     //     // ممكن تضيف Cubits تانية هنا
//     //   ],
//     //   child:
//       MaterialApp.router(
//         locale: DevicePreview.locale(context),
//         builder: DevicePreview.appBuilder,
//         routerConfig: AppRouter.router,
//         debugShowCheckedModeBanner: false,
      
//     );
//   }
// }





// =======
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider( create: (_) => di.sl<AuthCubit>(),
//           child: const LoginView(),),

//       ],
//       child: MaterialApp(
//         title: 'Flutter Clean Architecture',
//         debugShowCheckedModeBanner: false,
//         initialRoute: AppRouter.logoView,
//         onGenerateRoute: AppRouter.generateRoute,
//       ),
//     );
//   }

