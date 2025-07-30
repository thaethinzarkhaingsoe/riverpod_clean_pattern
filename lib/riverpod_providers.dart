
import 'package:riverpod/riverpod.dart';

import 'core/services/local_storage_service.dart';
import 'core/services/network_service.dart';

final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService(baseUrl: 'https://api.example.com');
});

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});
