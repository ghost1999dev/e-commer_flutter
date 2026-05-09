import 'package:equatable/equatable.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class InitEvent extends LoginEvent{
  const InitEvent();
}
class LoginFormReset extends LoginEvent{
  LoginFormReset();
}

class EmailChanged extends LoginEvent{
  final BlocFormItem email;
  const EmailChanged({required this.email});
  @override
  // TODO: implement props
  List<Object?> get props => [email];
}

class PasswordChanged extends LoginEvent{
  final BlocFormItem password;
  const PasswordChanged({required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [password];
}


class LoginSubmit extends LoginEvent{
  const LoginSubmit();
}