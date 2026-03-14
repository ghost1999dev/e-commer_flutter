import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:untitled/src/presentation/pages/register/RegisterBlocState.dart';

class RegisterBlocCubit extends Cubit<RegisterBlocState>{
  RegisterBlocCubit(): super(RegisterInitial());

  final _nameController = BehaviorSubject<String>();
  final _lastnameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController= BehaviorSubject<String>();

  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get lastnameStream => _lastnameController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get phoneStream => _phoneController.stream;
  Stream<String> get passwordControllerStream => _passwordController;
  Stream<String> get confirmPasswordStream=> _confirmPasswordController;

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

  void getImformation(){
    print('Name ${_nameController.value}');
  }


}