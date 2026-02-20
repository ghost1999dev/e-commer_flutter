import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:untitled/src/presentation/pages/login/LoginBloc.dart';

class LoginBlocCubit extends Cubit<LoginBloc>{
  LoginBlocCubit(): super(LoginInitial());

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;



  //Get values from email and password
  void changeEmail(String email){
    if(email.length <3){
      _emailController.sink.addError('The characters must be at least 3'
          'characters long');
    }else{
      _emailController.sink.add(email);
    }

  }
  void changePassword(String password){
    if(password.length <6){
      _emailController.sink.addError('The password must be at least 6'
          'characters long');
    }else{
      _emailController.sink.add(password);
    }
  }

  Stream<bool> get validateForm => Rx.combineLatest2(emailStream, passwordStream,
      (a,b)=>true
  );

  void dispose(){
    changePassword('');
    changeEmail('');
  }

  void getInformation(){
    print('EMAIL ${_emailController.value}');
    print('PASSWORD ${_passwordController.value}');

  }


}