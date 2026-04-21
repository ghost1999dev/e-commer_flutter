import 'package:untitled/src/data/dataSource/remote/service/AuthService.dart';
import 'package:untitled/src/domain/repository/AuthRepository.dart';
import 'package:untitled/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  Authservice authservice;
  AuthRepositoryImpl(this.authservice);
  @override
  Future<Resource> login(String email, String password) {
    return authservice.login(email, password);
  } 

  
  
}