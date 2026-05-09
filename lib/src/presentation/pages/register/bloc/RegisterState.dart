import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:untitled/src/domain/utils/Resource.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;

  final Resource? response;

  final GlobalKey<FormState>?formKey;
  const RegisterState({
    this.name = const BlocFormItem(error: "Ingresa tu nombre"),
    this.lastName = const BlocFormItem(error: "Ingresa tu apellido"),
    this.email = const BlocFormItem(error: "Ingresa tu email"),
    this.phone = const BlocFormItem(error: "Ingresa tu telefono"),
    this.password = const BlocFormItem(error: "Ingresa tu contrasenia"),
    this.confirmPassword = const BlocFormItem(error: "Confirma tu contrasenia"),
    this.response,
    this.formKey
  });

  RegisterState copyWidth({
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? email,
    BlocFormItem? phone,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    Resource? response,
    GlobalKey<FormState>? formKey,

  }){
    return RegisterState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      response: response,
      formKey: formKey
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    lastName,
    email,
    phone,
    password,
    confirmPassword,
    response
  ];
  

}