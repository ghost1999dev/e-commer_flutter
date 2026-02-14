
import 'package:flutter/material.dart';
import 'package:untitled/src/presentation/widgets/DefaultButton.dart';
import 'package:untitled/src/presentation/widgets/DefaultTextField.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
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
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
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
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25,right: 25,bottom: 10),
                      child: DefaultTextField(
                          label: 'Name',
                          icon: Icons.person,
                          onChange: (value){

                          },
                          obscureText: false,
                          isNumber: false
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25,right: 25,bottom: 10),
                      child: DefaultTextField(
                          label: 'Last name',
                          icon: Icons.person,
                          onChange: (value){

                          },
                          obscureText: false,
                          isNumber: false
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25,right: 25,bottom: 10),
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
                      margin: EdgeInsets.only(left: 25,right: 25,bottom: 10),
                      child: DefaultTextField(
                          label: 'Phone',
                          icon: Icons.phone,
                          onChange: (value){

                          },
                          obscureText: false,
                          isNumber: true
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25,right: 25,bottom: 10),
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
                      margin: EdgeInsets.only(left: 25,right: 25,bottom: 10),
                      child: DefaultTextField(
                          label: 'Confirm password',
                          icon: Icons.lock_outline,
                          onChange: (value){

                          },
                          obscureText: true,
                          isNumber: false
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 25,right: 25,top: 15),
                      child: DefaultButton(
                          text: 'REGISTER',
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white
                      ),
                    )
                  ],
                ),
              ),

            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 60,top: 60),
              child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                    color: Colors.white,
                  )
              ),
            )
          ],
        ),
      )
    );
  }
}
