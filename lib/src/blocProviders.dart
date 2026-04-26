import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/injection.dart';
import 'package:untitled/src/domain/useCases/auth/AuthUsesCases.dart';
import 'package:untitled/src/domain/useCases/auth/RegisterUsesCases.dart';
import 'package:untitled/src/presentation/pages/login/LoginBlocCubit.dart';
import 'package:untitled/src/presentation/pages/register/RegisterBlocCubit.dart';


List<BlocProvider> blocProviders=[
  BlocProvider<LoginBlocCubit>(create: (context)=>LoginBlocCubit(locator<AuthUsesCases>())),
  BlocProvider<RegisterBlocCubit>(create: (context)=> RegisterBlocCubit(locator<AuthUsesCases>()))
];