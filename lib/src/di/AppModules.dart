import 'package:untitled/src/data/dataSource/local/SharedPref.dart';
import 'package:untitled/src/data/repository/AuthRepositoryImpl.dart';
import 'package:untitled/src/data/dataSource/remote/service/AuthService.dart';
import 'package:untitled/src/domain/repository/AuthRepository.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/src/domain/useCases/auth/AuthUsesCases.dart';
import 'package:untitled/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:untitled/src/domain/useCases/auth/LoginAuthUseCase.dart';
import 'package:untitled/src/domain/useCases/auth/RegisterUsesCases.dart';
import 'package:untitled/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:untitled/src/presentation/pages/register/bloc/RegisterBloc.dart';
@module
abstract class AppModule{
  @injectable
  Authservice get authService => Authservice();
  @injectable
  SharedPref get sharedPref => SharedPref();
  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService,sharedPref);
  @injectable
  RegisterBloc get registerBloc => RegisterBloc(authUsesCases);
  @injectable
  AuthUsesCases get authUsesCases => AuthUsesCases(
    login: LoginAuthUseCase(authRepository),
    register: RegisterUsesCases(authRepository),
    saveUserSessionUseCase: SaveUserSessionUseCase(authRepository),
    getUserSessionUseCase: GetUserSessionUseCase(authRepository)
  );
}