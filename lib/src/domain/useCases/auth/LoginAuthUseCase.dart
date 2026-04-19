import 'package:untitled/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';

class LoginAuthUseCase {

  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
  //Realizar un disparador para lanze una funcion

  run(String email, String password)=> authRepositoryImpl.login(email, password);
  
}