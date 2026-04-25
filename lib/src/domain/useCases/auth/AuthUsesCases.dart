import 'package:injectable/injectable.dart';
import 'package:untitled/src/domain/useCases/auth/LoginAuthUseCase.dart';
import 'package:untitled/src/domain/useCases/auth/RegisterUsesCases.dart';


class AuthUsesCases {
  LoginAuthUseCase login;
  RegisterUsesCases register;

  AuthUsesCases({
    required this.login,
    required this.register
  });

  
}