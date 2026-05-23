import 'package:untitled/src/domain/models/AuthResponse.dart';
import 'package:untitled/src/domain/repository/AuthRepository.dart';

class GetUserSessionCase {

  AuthRepository authRepository;
  GetUserSessionCase(this.authRepository);
  Future<AuthResponse> run()=>authRepository.getUserSession();
  
}