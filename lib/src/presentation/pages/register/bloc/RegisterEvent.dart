import 'package:equatable/equatable.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';

abstract class RegisterEvent extends Equatable{
  const RegisterEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//Inicializar nuestro register init cuando la pantalla aparezca
 class RegisterInitEvent extends RegisterEvent {
   const RegisterInitEvent();
 }


 //Evento cuando el usuario escriba nuestro name
 class NameChangedEvent extends RegisterEvent{
    final BlocFormItem name;
    const NameChangedEvent({required this.name});
    @override
  // TODO: implement props
  List<Object?> get props => [name];
 }

 //Evento para el lastname

 class LastNameChangedEvent extends RegisterEvent {
   final BlocFormItem lastName;
   const LastNameChangedEvent({required this.lastName});
   @override
  // TODO: implement props
  List<Object?> get props => [lastName];
 }
 class EmailChangedEvent extends RegisterEvent {
   final BlocFormItem email;
   const EmailChangedEvent({required this.email});
   @override
  // TODO: implement props
  List<Object?> get props => [email];
 }
 class PhoneChangedEvent extends RegisterEvent {
   final BlocFormItem phone;
   const PhoneChangedEvent({required this.phone});
   @override
  // TODO: implement props
  List<Object?> get props => [phone];
 }
 class PasswordChangedEvent extends RegisterEvent {
   final BlocFormItem password;
   const PasswordChangedEvent({required this.password});
   @override
  // TODO: implement props
  List<Object?> get props => [password];
 }
 class ConfirmPasswordChangedEvent extends RegisterEvent {
   final BlocFormItem confirmPassword;
   const ConfirmPasswordChangedEvent({required this.confirmPassword});
   @override
  // TODO: implement props
  List<Object?> get props => [confirmPassword];
 }

 class RegisterSubmitEvent extends RegisterEvent{
  RegisterSubmitEvent();
 }

 class RegisterFormReset extends RegisterEvent {
   const RegisterFormReset();
 }