import 'package:injectable/injectable.dart';
import 'package:untitled/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';
import 'package:untitled/src/domain/repository/AuthRepository.dart';

class LoginAuthUseCase {

  AuthRepository repository;
  LoginAuthUseCase(this.repository);
  //Realizar un disparador para lanze una funcion

  run(String email, String password)=> repository.login(email, password);
  
}