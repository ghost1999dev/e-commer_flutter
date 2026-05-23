import 'package:untitled/src/domain/models/AuthResponse.dart';
import 'package:untitled/src/domain/repository/AuthRepository.dart';

class GetUserSessionUseCase {

  AuthRepository authRepository;
  GetUserSessionUseCase(this.authRepository);
  Future<AuthResponse> run()=>authRepository.getUserSession();
  
}