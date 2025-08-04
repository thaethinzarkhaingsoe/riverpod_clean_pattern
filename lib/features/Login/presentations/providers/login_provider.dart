import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutters/features/Login/data/repositories/login_repositiory.dart';
import 'package:flutters/features/Login/data/repositories/login_respoitory_impl.dart';

import '../../../../riverpod_providers.dart';
import '../../domains/entities/login_user_entity.dart';
import '../../domains/usecases/login_user_usecase.dart';

final loginProvider = StateNotifierProvider<LoginProvider, AsyncValue<UserEntity?>>((ref) {
  final repo = ref.read(loginRepositoryProvider);
  final useCase = LoginUseCase(repo);
  return LoginProvider(useCase);
});

class LoginProvider extends StateNotifier<AsyncValue<UserEntity?>> {
  final LoginUseCase loginUseCase;
  LoginProvider(this.loginUseCase) : super(const AsyncValue.data(null));

  Future<void> login(String email, String password, String memberID) async {
    state = const AsyncValue.loading();
    try {
      final user = await loginUseCase.execute(email, password,memberID);
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
