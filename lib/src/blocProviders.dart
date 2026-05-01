import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/injection.dart';
import 'package:untitled/src/domain/useCases/auth/AuthUsesCases.dart';
import 'package:untitled/src/domain/useCases/auth/RegisterUsesCases.dart';
import 'package:untitled/src/presentation/pages/bloc/LoginBloc.dart';
import 'package:untitled/src/presentation/pages/bloc/LoginEvent.dart';
import 'package:untitled/src/presentation/pages/register/RegisterBlocCubit.dart';


List<BlocProvider> blocProviders=[
  BlocProvider<LoginBloc>(create: (context)=>LoginBloc(locator<AuthUsesCases>())..add(InitEvent())),
  BlocProvider<RegisterBlocCubit>(create: (context)=> RegisterBlocCubit(locator<AuthUsesCases>()))
];