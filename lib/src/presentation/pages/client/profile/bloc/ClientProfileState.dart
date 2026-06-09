import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:untitled/src/domain/models/AuthResponse.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';

class ClientProfileState extends Equatable {
  final AuthResponse?authResponse;
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem phone;
  final GlobalKey<FormState>? formKey;
  const ClientProfileState({
    this.authResponse,
    this.name = const BlocFormItem(),
    this.lastName = const BlocFormItem(),
    this.phone = const BlocFormItem(),
    this.formKey
  });

  ClientProfileState copyWidth({
    AuthResponse? authResponse,
    BlocFormItem?name,
    BlocFormItem ? lastName,
    BlocFormItem? phone,
    GlobalKey<FormState>? formKey
  }){
    return ClientProfileState(
      authResponse: authResponse ?? this.authResponse,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      formKey: formKey
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    authResponse,
    name,
    lastName,
    phone
  ];
  
}