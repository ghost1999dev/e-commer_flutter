import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/injection.dart';
import 'package:untitled/src/domain/useCases/auth/AuthUsesCases.dart';
import 'package:untitled/src/domain/useCases/auth/RegisterUsesCases.dart';
import 'package:untitled/src/presentation/pages/login/bloc/LoginBloc.dart';
import 'package:untitled/src/presentation/pages/login/bloc/LoginEvent.dart';
import 'package:untitled/src/presentation/pages/register/bloc/RegisterBloc.dart';
import 'package:untitled/src/presentation/pages/register/bloc/RegisterEvent.dart';


List<BlocProvider> blocProviders=[
  BlocProvider<LoginBloc>(create: (context)=>LoginBloc(locator<AuthUsesCases>())..add(InitEvent())),
  BlocProvider<RegisterBloc>(create: (context)=> RegisterBloc(locator<AuthUsesCases>())..add(RegisterInitEvent()))
];