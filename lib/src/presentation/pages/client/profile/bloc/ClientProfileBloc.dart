import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/domain/models/AuthResponse.dart';
import 'package:untitled/src/domain/useCases/auth/AuthUsesCases.dart';
import 'package:untitled/src/presentation/pages/client/profile/bloc/ClientProfileEvent.dart';
import 'package:untitled/src/presentation/pages/client/profile/bloc/ClientProfileState.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';

class ClientProfileBloc extends Bloc<ClientProfileEvent,ClientProfileState>{
  AuthUsesCases authUsesCases;
  final formKey= GlobalKey<FormState>();
  ClientProfileBloc(this.authUsesCases):super(const ClientProfileState()){
    on<ClientProfileInit>(_onInit);
  }
  Future<void> _onInit(ClientProfileInit event,Emitter<ClientProfileState> emit)async{
    AuthResponse? session = await authUsesCases.getUserSessionCase.run();
    emit(state.copyWidth(
      authResponse: session,
      name: BlocFormItem(value: session?.createUserResponse.name ?? ""),
      lastName: BlocFormItem(value: session?.createUserResponse.lastName ?? ""),
      phone: BlocFormItem(value: session?.createUserResponse.phone ?? ""),
      formKey: formKey
    ));
  }

}