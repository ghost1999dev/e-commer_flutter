import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';

abstract class LoginEvent extends Equatable  {
  const LoginEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class InitEvent extends LoginEvent{
  const InitEvent();
}

class EmailChanged extends LoginEvent{
  final BlocFormItem email;
  const EmailChanged({
    required this.email
  });
  @override
  // TODO: implement props
  List<Object?> get props => [email];

}

class PasswordChange extends LoginEvent {
  final BlocFormItem password;
  const PasswordChange({required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class LoginSubmit extends LoginEvent{
  const LoginSubmit();
}
