import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:untitled/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:untitled/src/presentation/pages/client/home/bloc/ClientHomeState.dart';
import 'package:untitled/src/presentation/pages/login/bloc/LoginBloc.dart';
import 'package:untitled/src/presentation/pages/login/bloc/LoginEvent.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: BlocBuilder<ClientHomeBloc,ClientHomeState>(
        builder: (context,state){
          final user = state.authResponse?.createUserResponse;
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('${user?.name ?? ""} ${user?.lastName ?? ""}'), 
                  accountEmail: Text(user?.email ?? ""),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: user?.image !=null
                      ? NetworkImage(user!.image!)
                      : null,
                    child: user?.image == null
                      ? Icon(Icons.person)
                      :null,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Inicio'),
                  onTap: ()=>Navigator.pop(context),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Cerrar sesion'),
                  onTap: ()async{
                    //Limpiamos nuestro estado de loginbloc
                    context.read<LoginBloc>().add(const LoginReset());
                    //Primero borramos las sesion
                    context.read<ClientHomeBloc>().add(const Logout());
                    Navigator.pushNamedAndRemoveUntil(context, 'login', (route)=>false);
                  },
                )
              ],
            ),
          );
        }
      ),
      body: Center(
        child: Text("Client Home"),
      ),
    );
  }
}