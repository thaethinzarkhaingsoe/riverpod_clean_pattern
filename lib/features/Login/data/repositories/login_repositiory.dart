import '../../domains/entities/login_user_entity.dart';

abstract class LoginRepository {
  Future<UserEntity> login(String email, String password,String memberID);
}
