import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:untitled/src/data/dataSource/remote/service/AuthService.dart';
import 'package:untitled/src/domain/models/AuthResponse.dart';
import 'package:untitled/src/domain/useCases/auth/AuthUsesCases.dart';
import 'package:untitled/src/domain/useCases/auth/LoginAuthUseCase.dart';
import 'package:untitled/src/domain/utils/Resource.dart';
import 'package:untitled/src/presentation/pages/login/bloc/LoginEvent.dart';
import 'package:untitled/src/presentation/pages/login/bloc/LoginState.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  AuthUsesCases authUsesCases;
  LoginBloc(this.authUsesCases): super(LoginState()){
    on<InitEvent>(_onInitEvent);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmit>(_onLoginSubmit);
    on<LoginReset>(_onLoginReset);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(InitEvent event, Emitter<LoginState> emit)async{
    AuthResponse? session = await authUsesCases.getUserSessionCase.run();
    emit(state.copyWidth(formKey: formKey));
    if(session !=null){
      emit(state.copyWidth(
        response: Success(session),
        formKey: formKey
      ));
    }
  }
  Future<void> _onEmailChanged(EmailChanged event, Emitter<LoginState> emit)async{
    emit(state.copyWidth(
      email: BlocFormItem(
        value:event.email.value,
        error: event.email.value.isNotEmpty? null:"Ingrese el email"
      ),
      formKey: formKey
    ));

  }
  Future<void>_onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit)async{
    emit(state.copyWidth(
      password: BlocFormItem(
        value: event.password.value,
        error: event.password.value.isNotEmpty && event.password.value.length >=6 ? null:"Ingrese la contrasenia"
      ),
      formKey: formKey
    ));
  }
  Future<void> _onLoginSubmit(LoginSubmit event, Emitter<LoginState> emit)async{
    emit(state.copyWidth(response: Loading(),formKey: formKey));
    Resource authResponse=  await authUsesCases.login.run(
      state.email.value,
      state.password.value
    );
    if(authResponse is Success<AuthResponse>){
      //una ves se loguee el usuario se guardara la data en session
      await authUsesCases.saveUserSessionCase.run(authResponse.data);
    }
    emit(state.copyWidth(
      response: authResponse,
      formKey: formKey
    ));

  }
  Future<void> _onLoginReset(LoginReset event,Emitter<LoginState>emit)async{
    emit(LoginState(formKey: formKey));
  }
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _responseController = BehaviorSubject<Resource>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<Resource> get responseStream => _responseController.stream;


  void changeEmail(String email){
    if(email.length<3){
      _emailController.sink.addError('The email must be at least 6 characters');
    }else{
      _emailController.sink.add(email);
    }

  }

  void changePassword(String password){
    if(password.length < 6){
      _passwordController.sink.addError('The password must be at least 6 '
          'characters');
    }else{
      _passwordController.sink.add(password);
    }

  }

  Stream<bool> get validateForm => Rx.combineLatest2(
      emailStream, passwordStream,(a,b)=>true);

  void getInformation()async{
    _responseController.add(Loading());
    Resource authResponse=  await authUsesCases.login.run(_emailController.value, _passwordController.value);
    _responseController.add(authResponse);
  }


}