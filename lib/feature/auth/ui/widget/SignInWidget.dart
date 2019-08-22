import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/constant/Routes.dart';
import 'package:flutter_boilerplate/shared/util/FormValidator.dart';

import '../../blocs/AuthBloc.dart';
import '../../blocs/AuthBlocProvider.dart';
import '../../resource/AuthHelper.dart';

class SignInWidget extends StatefulWidget {
  SignInWidget({Key key}) : super(key: key);

  @override
  _SignInWidgetState createState() {
    return _SignInWidgetState();
  }
}

class _SignInWidgetState extends State<SignInWidget> {
  TextEditingController textEditControllerEmail = TextEditingController();
  TextEditingController textEditControllerPassword = TextEditingController();

  AuthBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = AuthBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  void signIn() {
    if (textEditControllerEmail.text.trim().isEmpty) {
      return;
    }

    if (textEditControllerPassword.text.trim().isEmpty) {
      return;
    }

    _bloc.signIn(textEditControllerEmail.text.trim(),
        textEditControllerPassword.text.trim());

    _bloc.signedIn.listen((value) {
      if (!value['error']) {
        print(value['data']);
        AuthHelper.setAccessToken(value['token']);
        Navigator.pushReplacementNamed(context, Routes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.showProgress,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return _formWidget();
          } else {
            if (!snapshot.data) {
              return _formWidget();
            } else {
              return _loadingWidget();
            }
          }
        });
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
              'Sign In',
              style: Theme.of(context).textTheme.title,
            ),
            const SizedBox(height: 30),
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
              decoration: InputDecoration(
                  labelText: 'Password', hintText: 'Enter your password'),
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
                child: const Text('Sign In',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.signUp);
                },
                child: const Text('Sign Up', style: TextStyle(fontSize: 18)),
              ),
            ),
            StreamBuilder<Map<String, dynamic>>(
              stream: _bloc.signedIn,
              builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.hasData) {
                  _successWidget("");
                } else if (snapshot.hasError) {
                  return _errorWidget(snapshot.error);
                } else {
                  return const SizedBox(height: 0);
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
