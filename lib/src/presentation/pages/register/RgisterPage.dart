import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/src/domain/utils/Resource.dart';
import 'package:untitled/src/presentation/pages/register/bloc/RegisterBloc.dart';
import 'package:untitled/src/presentation/pages/register/bloc/RegisterEvent.dart';
import 'package:untitled/src/presentation/pages/register/bloc/RegisterState.dart';
import 'package:untitled/src/presentation/pages/widgets/DefaultButton.dart';
import 'package:untitled/src/presentation/pages/widgets/DefaultTextField.dart';
import 'package:untitled/src/presentation/utils/BlocFormItem.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc? _registerBloc;
  @override
  Widget build(BuildContext context) {
    _registerBloc = BlocProvider.of<RegisterBloc>(context, listen: false);
    return Scaffold(
      body: Container(
          width: double.infinity,
          child: BlocBuilder<RegisterBloc,RegisterState>(
            builder: (context, state) {
              return Form(
                key:state.formState,
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/img/background_register.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    color: Colors.black54,
                    colorBlendMode: BlendMode.darken,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: MediaQuery.of(context).size.height * 0.85,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(232, 226, 226, 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: SingleChildScrollView(
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
                            'REGISTER',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 25, right: 25, bottom: 10),
                            child: DefaultTextField(
                                validator: (value)=>state.name.error,
                                label: 'Name',
                                isNumber: false,
                                icon: Icons.person,
                                onChange: (value) {
                                  _registerBloc?.add(NameChangedEvent(
                                    name: BlocFormItem(value: value)
                                  ));
                                },
                                obscureText: false),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 25, right: 25, bottom: 10),
                            child: DefaultTextField(
                                validator: (value)=>state.lastName.error,
                                label: 'Last name',
                                isNumber: false,
                                icon: Icons.person,
                                onChange: (value) {
                                  _registerBloc
                                      ?.add(LastNameChangedEvent(
                                        lastName: BlocFormItem(value:value)
                                      ));
                                },
                                obscureText: false),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 25, right: 25, bottom: 10),
                            child: DefaultTextField(
                                validator: (value)=>state.email.error,
                                label: 'Email',
                                isNumber: false,
                                icon: Icons.email,
                                onChange: (value) {
                                  _registerBloc?.add(EmailChangedEvent(
                                    email: BlocFormItem(value: value)
                                  ));
                                },
                                obscureText: false),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 25, right: 25, bottom: 10),
                            child: StreamBuilder(
                                stream: _registerBloc?.phoneStream,
                                builder: (context, snapshot) {
                                  return DefaultTextField(
                                      label: 'Phone',
                                      validator: (value)=>state.phone.error,
                                      isNumber: true,
                                      icon: Icons.phone,
                                      onChange: (value) {
                                        _registerBloc?.add(PhoneChangedEvent(
                                          phone: BlocFormItem(value: value)
                                        ));
                                      },
                                      obscureText: false);
                                }),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 25, right: 25, bottom: 10),
                            child: DefaultTextField(
                                label: 'Password',
                                validator:(value)=> state.password.error,
                                isNumber: false,
                                icon: Icons.lock,
                                onChange: (value) {
                                  _registerBloc
                                      ?.add(PasswordChangedEvent(
                                        password: BlocFormItem(value: value)
                                      ));
                                },
                                obscureText: true),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 25, right: 25, bottom: 10),
                            child: DefaultTextField(
                                label: 'Confirm password',
                                validator: (value)=>state.confirmPassword.error,
                                isNumber: false,
                                icon: Icons.lock_outline,
                                onChange: (value) {
                                  _registerBloc
                                      ?.add(ConfirmPasswordChangedEvent(
                                        confirmPassword: BlocFormItem(value: value)
                                      ));
                                },
                                obscureText: true),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin:
                                EdgeInsets.only(left: 25, right: 25, top: 15),
                            height: 50,
                            child: DefaultButton(
                                text: 'REGISTER',
                                onPressed: () {
                                  if(state.formState!.currentState!.validate()){
                                    _registerBloc?.add( RegisterSubmitEvent());
                                  }else{
                                    Fluttertoast.showToast(msg: "Formulario no valido");
                                  }
                                },
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 60, left: 50),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 35,
                          color: Colors.white,
                        )),
                  ),
                  BlocBuilder<RegisterBloc,RegisterState>(
                    builder: (context,state){
                      final responseState = state.response;

                      if(responseState is Loading){
                        return Center(child: CircularProgressIndicator());
                      }else if(responseState is Error){
                        Fluttertoast.showToast(
                          msg: responseState.message,
                          toastLength: Toast.LENGTH_LONG
                        );
                      }
                      else if(responseState is Success){
                        //_registerBloc?.add(const Regi)
                        Fluttertoast.showToast(
                          msg: "Registro exitoso",
                          toastLength: Toast.LENGTH_LONG
                        );
                      }
                      return Container();
                    }
                  )
                ],
              ));
            },
          )),
    );
  }
}
