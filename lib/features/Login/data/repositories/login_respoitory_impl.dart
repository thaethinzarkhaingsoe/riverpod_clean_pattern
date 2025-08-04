
import 'package:dio/dio.dart';
import 'package:flutters/features/Login/domains/entities/login_user_entity.dart';

import '../../../../core/exception/app_exceptons.dart';
import 'login_repositiory.dart';
class LoginRepositoryImpl implements LoginRepository {
  final Dio dio;
  LoginRepositoryImpl(this.dio);

  @override
  Future<UserEntity> login(String email, String password,String memberID) async {
    try {
      final response = await dio.post('/login', data: {
        'email': email,
        'password': password,
        'memberID': memberID,
      });

      if (response.statusCode == 200) {
        final data = response.data;
        return UserEntity(
          email: data['email'],
          password: data['password'],
          memberID: data['memberID'],
        );
      } else {
        throw NetworkException('Login failed: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw NetworkException('Network error: ${e.message}');
    }
  }
}
