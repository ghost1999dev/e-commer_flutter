import 'package:equatable/equatable.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';

abstract class RegisterEvent extends Equatable{
  const RegisterEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
 //Se lanza cuando la pantalla se abre - para inicializar el formKey
class RegisterInitEvent extends RegisterEvent{
  const RegisterInitEvent();
}
//Cuando el usuario escribe el name, se lanza este evento con el nuevo valor
class NameChanged extends RegisterEvent{
  final BlocFormItem name;
  const NameChanged({required this.name});
  @override
  // TODO: implement props
  List<Object?> get props => [name];
}
class LastNameChanged extends RegisterEvent{
  final BlocFormItem lastName;
  const LastNameChanged({required this.lastName});
  @override
  // TODO: implement props
  List<Object?> get props => [lastName];
}
class EmailChanged extends RegisterEvent{
  final BlocFormItem email;
  const EmailChanged({required this.email});
  @override
  // TODO: implement props
  List<Object?> get props => [email];
}

class PhoneChanged extends RegisterEvent {
  final BlocFormItem phone;
  const PhoneChanged({required this.phone});
  @override
  // TODO: implement props
  List<Object?> get props => [phone];
}
class PasswordChanged extends RegisterEvent {
  final BlocFormItem password;
  const PasswordChanged({required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [password];
}
class ConfirmPassword extends RegisterEvent {
  final BlocFormItem confirmPassword;
  const ConfirmPassword({required this.confirmPassword});
  @override
  // TODO: implement props
  List<Object?> get props => [confirmPassword];
}


class RegisterSubmit extends RegisterEvent{
  const RegisterSubmit();
}

class RegisterFormReset extends RegisterEvent{
  const RegisterFormReset();
}







