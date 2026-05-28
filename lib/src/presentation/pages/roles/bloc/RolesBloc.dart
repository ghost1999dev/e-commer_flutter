import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/domain/models/AuthResponse.dart';
import 'package:untitled/src/domain/useCases/auth/AuthUsesCases.dart';
import 'package:untitled/src/presentation/pages/roles/bloc/RolesEvent.dart';
import 'package:untitled/src/presentation/pages/roles/bloc/RolesState.dart';

class RolesBloc extends Bloc<RolesEvent,RolesState> {
  AuthUsesCases authUsesCases;
  RolesBloc(this.authUsesCases):super(RolesState()){
    on<GetRolesList>(_onGetRolesList);
  }

  Future<void>_onGetRolesList(GetRolesList event,Emitter<RolesState>emit)async{
    //Creamos un objeto de tipo authResponse
    AuthResponse? authResponse = await authUsesCases.getUserSessionCase.run();
    emit(
      state.copyWidth(
        roles: authResponse?.createUserResponse.roles
      )
    );
  }
  
}