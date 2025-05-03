import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:home/core/utils/api_service.dart';
import 'package:home/features/home/data/data_sources/profile_remote_data_source.dart';
import 'package:home/features/home/data/repos/profile_repository_impl.dart';
import 'package:home/features/home/domain/repos/profile_repository.dart';
import 'package:home/features/home/domain/usecases/get_profile.dart';
import 'package:home/features/home/domain/usecases/update_profile.dart';
import 'package:home/features/home/presentation/views/manager/profile_cubit/profile_cubit.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Dio & API Service
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => ApiService());

  // Data sources
  sl.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetProfileUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));


sl.registerFactory(() => ProfileCubit(
  getProfileUseCase: sl(),
  updateProfileUseCase: sl(),
));


}
