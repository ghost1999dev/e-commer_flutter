import 'package:flutter/material.dart';
import 'package:untitled/src/presentation/pages/widgets/DefaultButton.dart';
import 'package:untitled/src/presentation/pages/widgets/DefaultTextField.dart';
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
                color: Color.fromRGBO(232,226, 226, 0.5),
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
                          isNumber:false,
                          icon: Icons.person,
                          onChange: (value){
                            print(value);
                          },
                          obscureText: false
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25,right: 25,bottom: 10),
                      child: DefaultTextField(
                          label: 'Last name',
                          isNumber:false,
                          icon: Icons.person,
                          onChange: (value){
                            print(value);
                          },
                          obscureText: false
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25,right: 25,bottom: 10),
                      child: DefaultTextField(
                          label: 'Email',
                          isNumber: false,
                          icon: Icons.email,
                          onChange: (value){
                            print(value);
                          },
                          obscureText: false
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25,right: 25,bottom: 10),
                      child: DefaultTextField(
                          label: 'Phone',
                          isNumber:true,
                          icon: Icons.phone,
                          onChange: (value){
                            print(value);
                          },
                          obscureText: false
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25,right: 25,bottom: 10),
                      child: DefaultTextField(
                          label: 'Password',
                          isNumber:false,
                          icon: Icons.lock,
                          onChange: (value){
                            print(value);
                          },
                          obscureText: true
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25,right: 25,bottom: 10),
                      child: DefaultTextField(
                          label: 'Confirm password',
                          isNumber:false,
                          icon: Icons.lock_outline,
                          onChange: (value){
                            print(value);
                          },
                          obscureText: true
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 25,right: 25,top: 15),
                      height: 50,
                      child: DefaultButton(
                          text: 'REGISTER',
                          onPressed: (){

                          },
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 60,left: 50),
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

        
      ),
    );
  }
}
