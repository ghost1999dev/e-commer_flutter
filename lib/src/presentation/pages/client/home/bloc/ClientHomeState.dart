import 'package:equatable/equatable.dart';
import 'package:untitled/src/domain/models/AuthResponse.dart';

class ClientHomeState extends Equatable{
  final AuthResponse? authResponse;
  const ClientHomeState({
    this.authResponse
  });

  ClientHomeState copyWidth({
    AuthResponse? authResponse
  }){
    return ClientHomeState(authResponse: authResponse ?? this.authResponse);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [authResponse];
}