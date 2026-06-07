import 'package:untitled/src/domain/repository/AuthRepository.dart';

class LogoutUseCase {
  AuthRepository authRepository;
  LogoutUseCase(this.authRepository);

  Future<void> run()=>authRepository.logoutUserSession();
  
}