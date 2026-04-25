import 'package:untitled/src/domain/models/User.dart';
import 'package:untitled/src/domain/repository/AuthRepository.dart';

class RegisterUsesCases {

  AuthRepository repository;

  RegisterUsesCases(this.repository);
  run(User user)=> repository.register(user);
  
}