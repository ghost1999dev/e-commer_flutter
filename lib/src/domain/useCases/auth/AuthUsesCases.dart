import 'package:untitled/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:untitled/src/domain/useCases/auth/LoginAuthUseCase.dart';
import 'package:untitled/src/domain/useCases/auth/RegisterUsesCases.dart';
import 'package:untitled/src/domain/useCases/auth/SaveUserSessionUseCase.dart';

class AuthUsesCases {
  
  LoginAuthUseCase login;
  RegisterUsesCases register;
  SaveUserSessionUseCase saveUserSessionUseCase;
  GetUserSessionUseCase getUserSessionUseCase;
  AuthUsesCases({
    required this.login,
    required this.register,
    required this.saveUserSessionUseCase,
    required this.getUserSessionUseCase
  });
}