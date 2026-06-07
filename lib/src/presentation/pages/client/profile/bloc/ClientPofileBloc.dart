import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/domain/models/AuthResponse.dart';
import 'package:untitled/src/domain/useCases/auth/AuthUsesCases.dart';
import 'package:untitled/src/presentation/pages/client/profile/bloc/ClientProfileEvent.dart';
import 'package:untitled/src/presentation/pages/client/profile/bloc/ClientProfileState.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';

class ClientProfileBloc extends Bloc<ClientProfileEvent,ClientProfileState>{
  AuthUsesCases authUsesCases;
  final formKey = GlobalKey<FormState>();

  ClientProfileBloc(this.authUsesCases): super(const ClientProfileState()){
    on<ClientProfileInit>(_onInit);
  }
  Future<void> _onInit(ClientProfileInit event, Emitter<ClientProfileState>emit)async{
    AuthResponse? session = await authUsesCases.getUserSessionCase.run();
    emit(state.copyWidth(
      authResponse: session,
      name: BlocFormItem(value: session?.createUserResponse.name ?? ''),
      lastName:  BlocFormItem(value: session?.createUserResponse.lastName ?? ''),
      phone:     BlocFormItem(value: session?.createUserResponse.phone    ?? ''),
      formKey:   formKey,
    ));
  }

  Future<void> _onNameChanged(NameChanged event, Emitter<ClientProfileState> emit) async {
    emit(state.copyWidth(
      name: BlocFormItem(
        value: event.name.value,
        error: event.name.value.isNotEmpty ? null : 'Ingrese el nombre',
      ),
      formKey: formKey,
    ));
  }

  Future<void> _onLastNameChanged(LastNameChanged event, Emitter<ClientProfileState> emit) async {
    emit(state.copyWidth(
      lastName: BlocFormItem(
        value: event.lastName.value,
        error: event.lastName.value.isNotEmpty ? null : 'Ingrese el apellido',
      ),
      formKey: formKey,
    ));
  }

  Future<void> _onPhoneChanged(PhoneChanged event, Emitter<ClientProfileState> emit) async {
    emit(state.copyWidth(
      phone: BlocFormItem(
        value: event.phone.value,
        error: event.phone.value.isNotEmpty ? null : 'Ingrese el teléfono',
      ),
      formKey: formKey,
    ));
  }
}