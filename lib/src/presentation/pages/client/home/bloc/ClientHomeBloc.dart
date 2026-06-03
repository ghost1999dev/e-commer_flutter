import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/domain/models/AuthResponse.dart';
import 'package:untitled/src/domain/useCases/auth/AuthUsesCases.dart';
import 'package:untitled/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:untitled/src/presentation/pages/client/home/bloc/ClientHomeState.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent,ClientHomeState>{
  AuthUsesCases authUsesCases;
  ClientHomeBloc(this.authUsesCases):super(const ClientHomeState()){
    on<ClientHomeInit>(_onInit);
    on<Logout>(_onLogout);
  }

  Future<void>_onInit(ClientHomeInit event, Emitter<ClientHomeState>emit)async{
    AuthResponse? session = await authUsesCases.getUserSessionCase.run();
    emit(state.copyWidth(authResponse: session));
  }
  Future<void> _onLogout(Logout event,Emitter<ClientHomeState>emit)async{
    await authUsesCases.logoutUserSessionUseCase.run();
  }

}