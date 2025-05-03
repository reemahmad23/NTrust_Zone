import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/features/home/domain/entities/update_profile_entity.dart';
import 'package:home/features/home/domain/entities/user_profile.dart';
import 'package:home/features/home/domain/usecases/get_profile.dart';
import 'package:home/features/home/domain/usecases/update_profile.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileCubit({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
  }) : super(ProfileInitial());

  UserProfile? userProfile;

  Future<void> fetchUserProfile() async {
    emit(ProfileLoading());
    try {
      userProfile = await getProfileUseCase();
      emit(ProfileLoaded(userProfile!));
    } catch (e) {
      emit(ProfileError("فشل تحميل البيانات: ${e.toString()}"));
    }
  }

  Future<void> updateUserProfile(UpdateProfileEntity entity) async {
    emit(ProfileUpdating());
    try {
      await updateProfileUseCase(entity);
      userProfile = await getProfileUseCase(); // reload data
      emit(ProfileUpdated(userProfile!));
    } catch (e) {
      emit(ProfileError("فشل التعديل: ${e.toString()}"));
    }
  }
}
