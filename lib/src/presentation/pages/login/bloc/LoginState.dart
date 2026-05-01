import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:untitled/src/domain/utils/Resource.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';

class LoginState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  const LoginState({
    this.email = const BlocFormItem(error: "Ingresa el email"),
    this.password = const BlocFormItem(error: "Ingresa el password"),
    this.formKey,
    this.response
  });
  //Programacion funcional pura, el usuario lo modifica y me emite un estado 
  LoginState copyWidth({
    BlocFormItem? email,
    BlocFormItem? password,
    GlobalKey<FormState>? formKey,
    Resource? response
  }){
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
      response: response
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>[email,password,response];
}