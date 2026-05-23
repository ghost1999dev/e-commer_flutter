import 'package:untitled/src/data/dataSource/local/SharedPreference.dart';
import 'package:untitled/src/data/repository/AuthRepositoryImpl.dart';
import 'package:untitled/src/data/dataSource/remote/service/AuthService.dart';
import 'package:untitled/src/domain/repository/AuthRepository.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/src/domain/useCases/auth/AuthUsesCases.dart';
import 'package:untitled/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:untitled/src/domain/useCases/auth/LoginAuthUseCase.dart';
import 'package:untitled/src/domain/useCases/auth/RegisterUsesCases.dart';
import 'package:untitled/src/domain/useCases/auth/SaveUserSessionCase.dart';
import 'package:untitled/src/presentation/pages/register/bloc/RegisterBloc.dart';
@module
abstract class AppModule{
  @injectable
  Authservice get authService => Authservice();
  @injectable
  SharedPreference get sharedPref => SharedPreference();
  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService,sharedPref);

  @injectable
  RegisterBloc get registerBloc => RegisterBloc(authUsesCases);

  @injectable
  AuthUsesCases get authUsesCases => AuthUsesCases(
    login: LoginAuthUseCase(authRepository),
    register: RegisterUsesCases(authRepository),
    saveUserSessionCase: SaveUserSessionCase(authRepository),
    getUserSessionCase: GetUserSessionCase(authRepository)
  );
}