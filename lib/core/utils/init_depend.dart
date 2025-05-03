// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:home/core/utils/api_service.dart';
// import 'package:home/features/home/data/repos/profile_repository_impl.dart';
// import 'package:home/features/home/domain/repos/profile_repository.dart';
// import 'package:home/features/home/domain/usecases/get_profile.dart';
// import 'package:home/features/home/domain/usecases/get_profile_sas_usecase.dart';
// import 'package:home/features/home/domain/usecases/save_profile.dart';
// import 'package:home/features/home/domain/usecases/upload_profile.dart';

// final sl = GetIt.instance;

// void initDependencies() {
//   // Dio
//   sl.registerLazySingleton<Dio>(() => Dio());

//   // Token (ده مؤقت، ممكن تعملي له إدارة مستقلة بعدين)
//   const token = 'Bearer YOUR_TOKEN_HERE';

//   // ApiService
//   sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>(), token));

//   // Repository
//   sl.registerLazySingleton<UserProfileRepository>(
//     () => UserProfileRepositoryImpl(sl<ApiService>()),
//   );

//   // UseCases
//   sl.registerLazySingleton<GetProfilePictureSasUrlUseCase>(
//     () => GetProfilePictureSasUrlUseCase(sl()),
//   );

//   sl.registerLazySingleton<UploadProfilePictureUseCase>(
//     () => UploadProfilePictureUseCase(sl()),
//   );

//   sl.registerLazySingleton<SaveProfilePictureNameUseCase>(
//     () => SaveProfilePictureNameUseCase(sl()),
//   );

//   sl.registerLazySingleton<GetUserProfileUseCase>(
//     () => GetUserProfileUseCase(sl()),
