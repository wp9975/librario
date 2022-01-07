import 'package:flutter/material.dart';
import 'package:librario/screens/home/home.dart';
import 'package:librario/services/auth.dart';

class Sign_in extends StatefulWidget {
  final Function toggleView;
  Sign_in({required this.toggleView});
  @override
  _Sign_InState createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_in> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        elevation: 0.0,
        title: Text('Logowanie'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Rejestracja'),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
        child: Form(
          child: Column(
            children: <Widget>[
              // SizedBox(height: 20),
              // TextFormField(
              //   onChanged: (val) {
              //     setState(() => email = val);
              //   },
              // ),

              // SizedBox(height: 20),
              // TextFormField(
              //   obscureText: true,
              //   onChanged: (val) {
              //     setState(() => password = val);
              //   },
              // ),

              // SizedBox(height: 25.0),
              // RaisedButton(
              //   color: Colors.blue[400],
              //   child: Text(
              //     'Zaloguj się',
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   onPressed: () async {
              //     print(password);
              //   },
              // )

              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('assets/icons/logo.png')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 30, bottom: 0),
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 30),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () async {
                    dynamic result = await _auth.singInAnon();
                    if (result == null) {
                      print('Error signing in');
                    } else {
                      print('sign in');
                      print(result.uid);
                      print(password);
                      print(email);
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
