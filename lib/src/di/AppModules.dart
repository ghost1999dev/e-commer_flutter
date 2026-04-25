import 'package:injectable/injectable.dart';
import 'package:untitled/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';
import 'package:untitled/src/data/dataSource/remote/service/AuthService.dart';
import 'package:untitled/src/domain/repository/AuthRepository.dart';
import 'package:untitled/src/domain/useCases/auth/AuthUsesCases.dart';
import 'package:untitled/src/domain/useCases/auth/LoginAuthUseCase.dart';
import 'package:untitled/src/domain/useCases/auth/RegisterUsesCases.dart';
@module
abstract class AppModule {
  @injectable
  Authservice get authService => Authservice();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService);
  
  @injectable
  AuthUsesCases get authUseCases => AuthUsesCases(
    login: LoginAuthUseCase(authRepository),
    register: RegisterUsesCases(authRepository)
  );
  
}
