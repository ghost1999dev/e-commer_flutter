
import 'package:flutter/material.dart';
import 'package:untitled/src/presentation/widgets/DefaultButton.dart';
import 'package:untitled/src/presentation/widgets/DefaultTextField.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
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
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
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
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25,right: 25,bottom: 15),
                    child: DefaultTextField(
                        label: 'Email',
                        icon: Icons.email,
                        onChange: (value){

                        },
                        obscureText: false,
                        isNumber: false
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25,right: 25,bottom: 15),
                    child: DefaultTextField(
                        label: 'Password',
                        icon: Icons.lock,
                        onChange: (value){
                        },
                        obscureText: true,
                        isNumber: false
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 25,right: 25,bottom: 15),
                    height: 50,
                    child: ElevatedButton(
                        onPressed: (){},
                        child: Text(
                            'LOG IN',
                          style: TextStyle(
                            fontSize: 15,

                          ),

                        ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.black
                      ),
                    ),
                  ),
                  Text(
                      'You do not have account?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 25,right: 25,top: 15),
                    height: 50,
                    child: DefaultButton(
                        text: 'REGISTER',
                        onPressed: (){
                          Navigator.pushNamed(context, 'register');
                        },
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white
                    ),
                  )

                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}
