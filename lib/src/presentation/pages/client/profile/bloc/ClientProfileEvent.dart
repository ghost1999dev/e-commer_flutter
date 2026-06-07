import 'package:equatable/equatable.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';

class ClientProfileEvent extends Equatable {
  const ClientProfileEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//Cargar los datos desde la sesion
class ClientProfileInit extends ClientProfileEvent {
  const ClientProfileInit();
}

class NameChanged extends ClientProfileEvent{
  final BlocFormItem name;
  const NameChanged({required this.name});
  @override
  // TODO: implement props
  List<Object?> get props => [name];
}
class LastNameChanged extends ClientProfileEvent {
  final BlocFormItem lastName;
  const LastNameChanged({required this.lastName});
  @override
  // TODO: implement props
  List<Object?> get props => [lastName];
}
class PhoneChanged extends ClientProfileEvent {
  final BlocFormItem phone;
  const PhoneChanged({required this.phone});
  @override
  // TODO: implement props
  List<Object?> get props => [phone];
}


