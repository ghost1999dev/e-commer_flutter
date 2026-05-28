import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/src/domain/utils/Resource.dart';
import 'package:untitled/src/presentation/pages/login/bloc/LoginBloc.dart';
import 'package:untitled/src/presentation/pages/login/bloc/LoginEvent.dart';
import 'package:untitled/src/presentation/pages/login/bloc/LoginState.dart';
import 'package:untitled/src/presentation/pages/widgets/DefaultButton.dart';
import 'package:untitled/src/presentation/pages/widgets/DefaultTextField.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _loginBloc;
  @override
  Widget build(BuildContext context) {
    _loginBloc = BlocProvider.of<LoginBloc>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Form(
              key: state.formKey,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/img/background_shop.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    color: Colors.black54,
                    colorBlendMode: BlendMode.darken,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: MediaQuery.of(context).size.height * 0.70,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(232, 226, 226, 0.4),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 130,
                        ),
                        Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 25, right: 25, bottom: 15),
                          child: DefaultTextField(
                              label: 'Email',
                              icon: Icons.email,
                              onChange: (value) {
                                _loginBloc?.add(EmailChanged(
                                  email: BlocFormItem(
                                    value: value
                                  )
                                ));
                              },
                              validator: (value){
                                return state.email.error;
                              },
                              obscureText: false,
                              isNumber: false),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 25, right: 25, bottom: 15),
                          child: DefaultTextField(
                              label: 'Password',
                              icon: Icons.lock,
                              onChange: (value) {
                                _loginBloc?.add(PasswordChanged(
                                  password: BlocFormItem(
                                    value: value
                                  )
                                ));
                              },
                              validator: (value){
                                return state.password.error;
                              },
                              obscureText: true,
                              isNumber: false),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              EdgeInsets.only(left: 25, right: 25, bottom: 15),
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {

                              if (state.formKey!.currentState!.validate()) {
                                   _loginBloc?.add(LoginSubmit());   
                              }else{
                                Fluttertoast.showToast(msg: "Formulario no valido");
                              }
                             
                            },
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.black),
                          ),
                        ),
                        Text(
                          'You do not have account?',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                          height: 50,
                          child: DefaultButton(
                              text: 'REGISTER',
                              onPressed: () {
                                Navigator.pushNamed(context, 'register');
                              },
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white),
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<LoginBloc,LoginState>(
                    builder: (context,state){
                      final responseState = state.response;
                      if(responseState is Loading){
                        return Center(child: CircularProgressIndicator());
                      }
                      else if(responseState is Error){
                        Fluttertoast.showToast(
                          msg: responseState.message,
                          toastLength: Toast.LENGTH_LONG
                        );
                      }
                      else if(responseState is Success){
                        Fluttertoast.showToast(
                          msg: 'Login exitoso',
                          toastLength: Toast.LENGTH_LONG
                        );
                        WidgetsBinding.instance.addPostFrameCallback((callback){
                          Navigator.pushNamedAndRemoveUntil(context, 'roles', (route)=>false);
                        });
                      }

                      return Container();
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
