import 'package:untitled/src/data/dataSource/local/SharedPref.dart';
import 'package:untitled/src/data/dataSource/remote/service/AuthService.dart';
import 'package:untitled/src/domain/models/AuthResponse.dart';
import 'package:untitled/src/domain/models/CreateUserResponse.dart';
import 'package:untitled/src/domain/models/User.dart';
import 'package:untitled/src/domain/repository/AuthRepository.dart';
import 'package:untitled/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  Authservice authservice;
  SharedPref sharedPref;

  AuthRepositoryImpl(this.authservice,this.sharedPref);
  @override
  Future<Resource> login(String email, String password) {
    return authservice.login(email, password);
  }

  @override
  Future<Resource<CreateUserResponse>> register(User user) {
    // TODO: implement register
    return authservice.register(user);
  }

  @override
  Future<AuthResponse> getUserSession() async{
    AuthResponse authResponse = AuthResponse.fromJson(await sharedPref.read('user'));
    return authResponse;
  }
  
  @override
  Future<void> saveUserSession(AuthResponse authResponse)async {
    // TODO: implement saveUserSession
    await  sharedPref.save('user', authResponse.toJson());
  } 
  
}