import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/i18n.dart';
import 'package:flutter_boilerplate/shared/base/DataState.dart';
import 'package:flutter_boilerplate/shared/constant/Routes.dart';

import '../../blocs/AuthBloc.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  AuthBloc _bloc;

//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//    _bloc = AuthBlocProvider.of(context);
//  }

  @override
  void initState() {
    super.initState();
    _bloc = AuthBloc();
    _listen();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }


  void _listen() {
    _bloc.signedIn.listen((value) {
      if (value is StateSuccessWithMap) {
        Navigator.pushReplacementNamed(context, Routes.home);
      }
    });
  }
  void signIn() {
    _bloc.signIn();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.signedIn,
        initialData: StateInitial(),
        builder: (BuildContext context, AsyncSnapshot<DataState> snapshot) {
          final state = snapshot.data;

          if (state is StateInitial) {
            return _formWidget();
          }

          if (state is StateLoading) {
            return _loadingWidget();
          }

//          if (state is StateSuccessWithMap) {
//            Navigator.pushReplacementNamed(context, Routes.home);
//          }

          return Container();
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
              S.of(context).sign_in,
              style: Theme.of(context).textTheme.title,
            ),
            const SizedBox(height: 10),
            emailField(),
            const SizedBox(height: 10),
            passwordField(),
            const SizedBox(height: 25),
            signInButton(),
            const SizedBox(height: 10),
            signUpButton(),
          ],
        ),
      ),
    );
  }

  Widget passwordField() {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: _bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
                hintText: S.of(context).passwordHint,
                errorText: snapshot.error),
          );
        });
  }

  Widget emailField() {
    return StreamBuilder(
        stream: _bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: _bloc.changeEmail,
            decoration: InputDecoration(
                hintText: S.of(context).emailHint, errorText: snapshot.error),
          );
        });
  }

  Widget signInButton() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          signIn();
        },
        child: Text(S.of(context).sign_in, style: TextStyle(fontSize: 18)),
      ),
    );
  }

  Widget signUpButton() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.signUp);
        },
        child: Text(
          S.of(context).sign_up,
          style: TextStyle(fontSize: 18, color: Colors.blueGrey),
        ),
      ),
    );
  }

  Widget _loadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(S.of(context).please_wait), CircularProgressIndicator()],
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
