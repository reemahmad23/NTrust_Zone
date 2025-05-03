import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/data/datasource/auth_remote_datasource.dart';
import 'features/auth/data/datasource/auth_remote_datasource_impl.dart';
import 'features/auth/data/repositories/auth_repo_impl.dart';
import 'features/auth/domain/repositories/auth_repo.dart';
import 'features/auth/domain/usecases/login_use_case.dart';
import 'features/auth/domain/usecases/sign_up_usecase.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
// import 'features/place_details/data/datasources/review_remote_data_source.dart';
// import 'features/place_details/data/datasources/review_remote_data_source_impl.dart';
// import 'features/place_details/data/repositories/review_repository_impl.dart';
// import 'features/place_details/domain/repositories/review_repository.dart';
// import 'features/place_details/domain/usecaces/create_review_usecase.dart';
// import 'features/place_details/presentation/cubit/review_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // Auth
  sl.registerFactory(() => AuthCubit(sl(), sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()));

  // // Reviews
  // sl.registerFactory(() => ReviewCubit(addReviewUseCase: sl()));
  // sl.registerLazySingleton(() => CreateReviewUseCase(sl()));
  // sl.registerLazySingleton<ReviewRemoteDataSource>(() => ReviewRemoteDataSourceImpl( sl()));
  // sl.registerLazySingleton<ReviewRepository>(() => ReviewRepositoryImpl( remoteDataSource: sl(),));
  // sl.registerLazySingleton<ReviewRemoteDataSource>(() => ReviewRemoteDataSourceImpl(sl()));
}
