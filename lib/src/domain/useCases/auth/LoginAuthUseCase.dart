import 'package:untitled/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';

class LoginAuthUseCase {

  Authrepositoryimpl authrepositoryimpl = Authrepositoryimpl();
  run(String email,String password)=> authrepositoryimpl.login(email, password);

  
}