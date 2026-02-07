import 'package:flutter/material.dart';

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
              'assets/img/background_shoop.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.75,
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
                    size: 125,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25,right: 25,bottom: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text(
                            'Email',
                            style: TextStyle(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25,right: 25,bottom: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text(
                            'Password',
                            style: TextStyle(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 25, right: 25, top: 20,bottom: 10),
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                          'LOG IN',
                        style: TextStyle(
                          fontSize: 17
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.black),
                    ),
                  ),
                  Text(
                      'Do you have not account ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 25, right: 25, top: 20,bottom: 10),
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                            fontSize: 17
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
