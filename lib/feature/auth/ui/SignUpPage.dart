import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/routes.dart';
import '../blocs/AuthBloc.dart';
import 'package:flutter_boilerplate/feature/auth/resource/AuthHelper.dart';
import 'dart:developer';
import 'dart:convert';

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
    return _buildInputWidget();

    if (isLoading) {
      return _buildLoadingWidget();
    } else {
      return _buildInputWidget();
    }
  }

  Widget _buildInputWidget() {
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
            TextField(
              controller: textEditControllerName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            const SizedBox(height: 10),
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
                  _buildSuccessWidget("");
                } else if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.error);
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

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Please Wait..."), CircularProgressIndicator()],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(error), CircularProgressIndicator()],
    ));
  }

  Widget _buildSuccessWidget(String message) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(message), CircularProgressIndicator()],
    ));
  }
}
