// import 'package:flutter/material.dart';
// import 'package:home/core/utils/app_router.dart';
// import 'package:device_preview/device_preview.dart';
// void main() async {
//   runApp(
//     DevicePreview(
//     enabled: true,
//     builder: (context) => const TrustZone(),
//   )
//   );
// }
//
// class TrustZone extends StatelessWidget {
//   const TrustZone({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//         locale: DevicePreview.locale(context),
//         builder: DevicePreview.appBuilder,
//
//         debugShowCheckedModeBanner: false,
//
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_zone/core/utils/app_router.dart';
import 'core/network/dio_helper.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/auth/presentation/views/login_view.dart';
import 'injection_container.dart' as di;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  di.init();
  runApp( NTrustZone());
}

class NTrustZone extends StatelessWidget {
  const NTrustZone({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (_) => di.sl<AuthCubit>(),
          child: const LoginView(),),

      ],
      child: MaterialApp(
        title: 'Flutter Clean Architecture',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.logoView,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
