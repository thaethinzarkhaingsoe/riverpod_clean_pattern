
import 'package:dio/dio.dart';
import 'package:flutters/features/Login/data/repositories/login_repositiory.dart';
import 'package:flutters/features/Login/data/repositories/login_respoitory_impl.dart';
import 'package:riverpod/riverpod.dart';

import 'core/services/local_storage_service.dart';
import 'core/services/network_service.dart';


/// ✅ Dio Provider for HTTPS API calls
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://your-secure-api.com/api', // ✅ Use HTTPS URL
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  // ✅ Optional: Add logging interceptor
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
  ));

  return dio;
});
final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService(baseUrl: 'https://api.example.com');
});

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});
final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepositoryImpl(ref.read(dioProvider));
});
