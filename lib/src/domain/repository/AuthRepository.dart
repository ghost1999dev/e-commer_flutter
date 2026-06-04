import 'package:untitled/src/domain/models/AuthResponse.dart';
import 'package:untitled/src/domain/models/CreateUserResponse.dart';
import 'package:untitled/src/domain/models/User.dart';
import 'package:untitled/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<void> logout();
  Future<AuthResponse?> getUserSession();
  Future<Resource> login(String email, String password);
  Future<Resource<CreateUserResponse>> register(User user);
}