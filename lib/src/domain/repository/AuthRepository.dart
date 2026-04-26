import 'package:untitled/src/domain/models/CreateUserResponse.dart';
import 'package:untitled/src/domain/models/User.dart';
import 'package:untitled/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  Future<Resource> login(String email, String password);
  Future<Resource<CreateUserResponse>> register(User user);
}