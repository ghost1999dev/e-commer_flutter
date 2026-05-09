import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:untitled/src/domain/models/CreateUserResponse.dart';
import 'package:untitled/src/domain/models/User.dart';
import 'package:untitled/src/domain/useCases/auth/AuthUsesCases.dart';
import 'package:untitled/src/domain/utils/Resource.dart';
import 'package:untitled/src/presentation/pages/register/bloc/RegisterEvent.dart';
import 'package:untitled/src/presentation/pages/register/bloc/RegisterState.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{
  AuthUsesCases authUsesCases;
  RegisterBloc(this.authUsesCases): super(RegisterState()){
    on<RegisterInitEvent>(_onInitEvent);
    on<NameChangedEvent>(_onNameChanged);
    on<LastNameChangedEvent>(_onLastNameChanged);
    on<PhoneChangedEvent>(_onPhoneChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<ConfirmPasswordChangedEvent>(_onConfirmPasswordChanged);
    on<EmailChangedEvent>(_onEmailChanged);
    on<RegisterSubmitEvent>(_onRegisterSubmit);
    //on<RegisterFormReset>(_onRegiserFormReset);
  }

  final formKey = GlobalKey<FormState>();

  Future<void>_onInitEvent(RegisterInitEvent event, Emitter<RegisterState> emit)async{
    emit(state.copyWidth(formState: formKey));
  }
  Future<void>_onNameChanged(NameChangedEvent event,Emitter<RegisterState> emit)async{
    emit(state.copyWidth(
      name: BlocFormItem(
        value: event.name.value,
        error: event.name.value.length >=2 ? null:"Minimo 2 caracteres"
      ),
      formState: formKey
    ));
  }
  Future<void>_onLastNameChanged(LastNameChangedEvent event,Emitter<RegisterState> emit)async{
    emit(state.copyWidth(
      lastName: BlocFormItem(
        value: event.lastName.value,
        error: event.lastName.value.length >=2 ? null:"Minimo 2 caracteres"
      ),
      formState: formKey
    ));
  }

  Future<void>_onPhoneChanged(PhoneChangedEvent event,Emitter<RegisterState> emit)async{
    emit(state.copyWidth(
      phone: BlocFormItem(
        value: event.phone.value,
        error: event.phone.value.length >=8 ? null: "Minimo 8 caracteres"
      ),
      formState: formKey
    ));
  }
  Future<void>_onPasswordChanged(PasswordChangedEvent event,Emitter<RegisterState> emit)async{
    emit(state.copyWidth(
      password: BlocFormItem(
        value: event.password.value,
        error: event.password.value.length >=6 ? null: "Minimo 6 caracteres"
      ),
      formState: formKey
    ));
  }
  Future<void>_onConfirmPasswordChanged(ConfirmPasswordChangedEvent event,Emitter<RegisterState> emit)async{
    emit(state.copyWidth(
      confirmPassword: BlocFormItem(
        value: event.confirmPassword.value,
        error: event.confirmPassword.value == state.password.value
              ? null
              : "Las contrasenias no coinciden"
      ),
      formState: formKey
    ));
  }
  Future<void>_onEmailChanged(EmailChangedEvent event, Emitter<RegisterState>emit)async{
    bool validateEmail =
          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(event.email.value);
    emit(state.copyWidth(
      email: BlocFormItem(
        value: event.email.value,
        error: validateEmail ? null : "Email no valido"
      ),
      formState: formKey
    ));
  }

  Future<void>_onRegisterSubmit(RegisterSubmitEvent event, Emitter<RegisterState>emit)async{
    //El estado de cargando
    emit(state.copyWidth(response: Loading(),formState: formKey));
    User user =User(
      name: state.name.value, 
      lastname: state.lastName.value, 
      phone: state.phone.value, 
      email: state.email.value, 
      password: state.password.value
    );

    Resource response = await authUsesCases.register.run(user);
    emit(state.copyWidth(response: response,formState: formKey));
  }





  final _nameController = BehaviorSubject<String>();
  final _lastnameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController= BehaviorSubject<String>();
  final _responseController = BehaviorSubject<Resource>();

  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get lastnameStream => _lastnameController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get phoneStream => _phoneController.stream;
  Stream<String> get passwordControllerStream => _passwordController;
  Stream<String> get confirmPasswordStream=> _confirmPasswordController;
  Stream<Resource> get responseStream => _responseController;
  Stream<bool> get validateForm => Rx.combineLatest6(
      nameStream,
      lastnameStream,
      emailStream,
      phoneStream,
      passwordControllerStream,
      confirmPasswordStream,
      (a,b,c,d,e,f)=>true
  );

  //validations
  void changeName(String name){
    if(name.length <2){
      _nameController.sink.addError('The name is not longer');
    }else{
      _nameController.sink.add(name);
    }
  }

  void changeLastName(String lastName){
    if(lastName.length <2){
      _lastnameController.sink.addError('The lastname is not longer');
    }else{
      _lastnameController.sink.add(lastName);
    }
  }

  void changeEmail(String email){
    bool emailFormatValid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    if(email.length<5){
      _emailController.sink.addError('The email is not longer');
    }else if(!emailFormatValid){
      _emailController.sink.addError('The email is invalid');
    }else{
      _emailController.sink.add(email);
    }
  }

  void changePhone(String phone){
    if(phone.length <8){
      _phoneController.sink.addError('Is not a number phone available');
    }else{
      _phoneController.sink.add(phone);
    }
  }


  void changePassword (String password){
    if(password.length <6){
      _passwordController.sink.addError('At least 6 characters');
    }else{
      _passwordController.sink.add(password);
    }
  }

  void changeConfirmPassword ( String confirmPassword){
    if(confirmPassword.length <6){
      _confirmPasswordController.sink.addError('At least 6 characters');
    }else if(confirmPassword != _passwordController.value){
      _confirmPasswordController.sink.addError('The password are not the same');
    }else{
      _confirmPasswordController.sink.add(confirmPassword);
    }
  }

  void register()async{
    _responseController.add(Loading());
    User user = User(
      name: _nameController.value, 
      lastname: _lastnameController.value, 
      phone: _phoneController.value, 
      email: _emailController.value, 
      password: _passwordController.value
    );
    print(user.toJson());
    Resource<CreateUserResponse> response = await authUsesCases.register.run(user);
    _responseController.add(response);
  }


}