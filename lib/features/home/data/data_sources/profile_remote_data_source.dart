
import 'package:home/core/utils/api_service.dart';
import 'package:home/features/home/data/models/profile_model/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileModel> getProfile();
  Future<void> updateProfile(Map<String, dynamic> data);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserProfileModel> getProfile() async {
    final response = await apiService.get('/api/UserProfile');
    //print('Response: ${response.data}');
    return UserProfileModel.fromJson(response.data);
  }

  @override
  Future<void> updateProfile(Map<String, dynamic> data) async {
    await apiService.put('/api/UserProfile', data: data);
  }

}
