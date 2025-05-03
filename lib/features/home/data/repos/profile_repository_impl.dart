import 'package:home/features/home/data/models/profile_model/update_profile_model.dart';
import 'package:home/features/home/domain/entities/update_profile_entity.dart';
import 'package:home/features/home/domain/entities/user_profile.dart';
import 'package:home/features/home/domain/repos/profile_repository.dart';
import '../data_sources/profile_remote_data_source.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepoImpl(this.remoteDataSource);

  @override
  Future<UserProfile> getProfile() async {
    final model = await remoteDataSource.getProfile();
    return model.toEntity();
  }

  @override
  Future<void> updateProfile(UpdateProfileEntity entity) async {
    final model = UpdateProfileModel.fromEntity(entity);
    await remoteDataSource.updateProfile(model.toJson());
  }
}
