import 'package:untitled/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';
import 'package:untitled/src/domain/repository/AuthRepository.dart';

class LoginAuthUseCase {

  AuthRepository repository;
  LoginAuthUseCase(this.repository);

  run(String email, String password)=> repository.login(email, password);
  
}