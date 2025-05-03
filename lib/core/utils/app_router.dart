import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home/core/utils/set_up_service_locator.dart';
import 'package:home/features/home/presentation/views/edit_profile_view.dart';
import 'package:home/features/home/presentation/views/manager/profile_cubit/profile_cubit.dart';
import 'package:home/features/home/presentation/views/profile_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => sl<ProfileCubit>()..fetchUserProfile(),
        child: const ProfileView(),
      ),
    ),
    GoRoute(
      path: '/editProfile',
      builder: (context, state) => BlocProvider.value(
        value: sl<ProfileCubit>(),
        child: const EditProfileView(),
      ),
    ),
    ],
  );
}
