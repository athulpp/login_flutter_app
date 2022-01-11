import 'package:demo/HomePage.dart';
import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();

  final _passwordController = TextEditingController();
  @override
  void initState() {
    loggin(context);
    // TODO: implement initState
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                  controller: _userController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value is Empty';
                    }
                    if (_userController.text != 'athul') {
                      return 'Please Enter correct Username';
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value is Empty';
                    }
                    if (_passwordController.text != '12345') {
                      return 'Please Enter correct Password';
                    } else {
                      return null;
                    }
                  }),
              ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                    validate(context);
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }

  void validate(BuildContext ctx) async {
    SharedPreferences database = await SharedPreferences.getInstance();
    if (_userController.text == 'athul' &&
        _passwordController.text == '12345') {
      database.setBool(KEY, true);
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}

void loggin(BuildContext ctx) async {
  SharedPreferences database = await SharedPreferences.getInstance();
  if (database.getBool(KEY) == true) {
    Navigator.of(ctx)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
  }
}
