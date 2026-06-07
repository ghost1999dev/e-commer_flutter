import 'package:untitled/src/domain/repository/AuthRepository.dart';

class LogoutUserSessionUseCase {
  AuthRepository authRepository;
  LogoutUserSessionUseCase(this.authRepository);
  Future<void> run()=> authRepository.logoutUserSession();
}