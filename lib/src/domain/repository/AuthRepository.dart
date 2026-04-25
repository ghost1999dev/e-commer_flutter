import 'package:untitled/src/domain/models/AuthResponse.dart';
import 'package:untitled/src/domain/models/User.dart';
import 'package:untitled/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<AuthResponse>>register(User user);
}