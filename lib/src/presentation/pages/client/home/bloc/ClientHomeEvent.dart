import 'package:equatable/equatable.dart';

abstract class ClientHomeEvent extends Equatable{
  const ClientHomeEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ClientHomeInit extends ClientHomeEvent{
  const ClientHomeInit();
}

class Logout extends ClientHomeEvent{
  const Logout();
}