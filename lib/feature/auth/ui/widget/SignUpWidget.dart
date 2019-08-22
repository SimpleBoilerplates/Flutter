import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/constant/Routes.dart';
import 'package:flutter_boilerplate/shared/util/FormValidator.dart';

import '../../blocs/AuthBloc.dart';
import '../../blocs/AuthBlocProvider.dart';

class SignUpWidget extends StatefulWidget {
  SignUpWidget({Key key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  AuthBloc _bloc;

  TextEditingController textEditControllerEmail = TextEditingController();
  TextEditingController textEditControllerPassword = TextEditingController();
  TextEditingController textEditControllerName = TextEditingController();

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

    if (textEditControllerName.text.trim().isEmpty) {
      return;
    }

    _bloc.signUp(
        textEditControllerEmail.text.trim(),
        textEditControllerPassword.text.trim(),
        textEditControllerName.text.trim());

    _bloc.signedUp.listen((value) {
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
              stream: _bloc.signedUp,
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
