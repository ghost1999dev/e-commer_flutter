import 'package:untitled/src/data/dataSource/remote/service/AuthService.dart';
import 'package:untitled/src/domain/models/AuthResponse.dart';
import 'package:untitled/src/domain/models/User.dart';
import 'package:untitled/src/domain/repository/AuthRepository.dart';
import 'package:untitled/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  Authservice authservice;
  AuthRepositoryImpl(this.authservice);
  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authservice.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    // TODO: implement register
    return authservice.register(user);
  } 

  
  
}