import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/routes.dart';
import '../blocs/auth_bloc.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  TextEditingController textEditControllerEmail = new TextEditingController();
  TextEditingController textEditControllerPassword =
      new TextEditingController();

  void signIn() {
    if (textEditControllerEmail.text.trim().isEmpty) {
      return;
    }

    if (textEditControllerPassword.text.trim().isEmpty) {
      return;
    }

    bloc.signIn(textEditControllerEmail.text.trim(),
        textEditControllerPassword.text.trim());
    bloc.signedIn.listen((onData) {
      //Navigator.pushReplacementNamed(context, Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign In',
              style: Theme.of(context).textTheme.title,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: textEditControllerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: textEditControllerPassword,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                onPressed: () {
                  signIn();
                },
                child: const Text('Sign In', style: TextStyle(fontSize: 20)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
