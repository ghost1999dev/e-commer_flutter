import 'package:untitled/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:untitled/src/domain/useCases/auth/LoginAuthUseCase.dart';
import 'package:untitled/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:untitled/src/domain/useCases/auth/RegisterUsesCases.dart';
import 'package:untitled/src/domain/useCases/auth/SaveUserSessionCase.dart';

class AuthUsesCases {
  
  LoginAuthUseCase login;
  RegisterUsesCases register;
  SaveUserSessionCase saveUserSessionCase;
  GetUserSessionCase getUserSessionCase;
  LogoutUseCase logoutUseCase;
  AuthUsesCases({
    required this.login,
    required this.register,
    required this.saveUserSessionCase,
    required this.getUserSessionCase,
    required this.logoutUseCase
  });
}