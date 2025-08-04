
import 'package:flutters/features/Login/data/repositories/login_repositiory.dart';

import '../entities/login_user_entity.dart';

class LoginUseCase {
  final LoginRepository repository;
  LoginUseCase(this.repository);

  Future<UserEntity> execute(String email, String password,String memberID) async {
    //  Business rule
    if (email.isEmpty || password.isEmpty||memberID.isEmpty) {
      throw Exception('Fields cannot be empty');
    }
    return await repository.login(email, password,memberID);
  }
}
