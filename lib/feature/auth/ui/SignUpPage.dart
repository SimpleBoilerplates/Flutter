import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/routes.dart';
import '../blocs/AuthBloc.dart';
import 'package:flutter_boilerplate/feature/auth/resource/AuthHelper.dart';
import 'dart:developer';
import 'dart:convert';
import 'package:flutter_boilerplate/shared/helper/FormValidator.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = false;

  TextEditingController textEditControllerEmail = new TextEditingController();
  TextEditingController textEditControllerPassword =
      new TextEditingController();
  TextEditingController textEditControllerName = new TextEditingController();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  void signIn() {
    if (textEditControllerEmail.text.trim().isEmpty) {
      return;
    }

    if (textEditControllerPassword.text.trim().isEmpty) {
      return;
    }

    if (textEditControllerName.text.trim().isEmpty) {
      return;
    }

    setState(() {
      isLoading = true;
    });
    bloc.signUp(
        textEditControllerEmail.text.trim(),
        textEditControllerPassword.text.trim(),
        textEditControllerName.text.trim());

    bloc.signedIn.listen((value) {
      setState(() {
        isLoading = false;
      });

      if (!value["error"]) {
        //print(value["data"]);
        //AuthHelper.setAccessToken(value["token"]);
        //Navigator.pushReplacementNamed(context, Routes.home);
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _formWidget();

    if (isLoading) {
      return _loadingWidget();
    } else {
      return _formWidget();
    }
  }

  Widget _formWidget() {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.title,
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: textEditControllerName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Full Name'),
              validator: FormValidator.validateName,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: textEditControllerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
              validator: FormValidator.validateEmail,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: textEditControllerPassword,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              validator: FormValidator.validatePassword,
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                color: Colors.blueGrey,
                onPressed: () {
                  signIn();
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.signIn);
                },
                child: const Text('Sign In', style: TextStyle(fontSize: 18)),
              ),
            ),
            StreamBuilder<Map<String, dynamic>>(
              stream: bloc.signedIn,
              builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.hasData) {
                  _successWidget("");
                } else if (snapshot.hasError) {
                  return _errorWidget(snapshot.error);
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _loadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Please Wait..."), CircularProgressIndicator()],
    ));
  }

  Widget _errorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(error), CircularProgressIndicator()],
    ));
  }

  Widget _successWidget(String message) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(message), CircularProgressIndicator()],
    ));
  }
}
