import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/i18n.dart';
import 'package:flutter_boilerplate/shared/base/DataState.dart';
import 'package:flutter_boilerplate/shared/constant/Routes.dart';
import 'package:flutter_boilerplate/shared/widget/PopUpAlert.dart';

import '../../blocs/AuthBloc.dart';

class SignUpScreen extends StatefulWidget {
 const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

  void signUp() {
    _bloc.signUp();
  }

  void _listen() {
    _bloc.signedUp.listen((value) {
      if (value is StateSuccessWithMap) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.signedUp,
        initialData: StateInitial(),
        builder: (BuildContext context, AsyncSnapshot<DataState> snapshot) {
          final state = snapshot.data;

          if (state is StateInitial) {
            return _formWidget();
          }

          if (state is StateLoading) {
            return _loadingWidget();
          }

          if(state is StateError){
            ackAlert(context, "", state.message);
          }

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
              S.of(context).sign_up,
              style: Theme.of(context).textTheme.title,
            ),
            const SizedBox(height: 30),
            nameField(),
            const SizedBox(height: 10),
            emailField(),
            const SizedBox(height: 10),
            passwordField(),
            const SizedBox(height: 25),
            signUpButton(),
            const SizedBox(height: 10),
            signInButton()
          ],
        ),
      ),
    );
  }

  Widget nameField() {
    return StreamBuilder(
        stream: _bloc.name,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: _bloc.changeName,
            obscureText: true,
            decoration: InputDecoration(
                hintText: S.of(context).passwordHint,
                errorText: snapshot.error),
          );
        });
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

  Widget signUpButton() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: RaisedButton(
        color: Colors.blueGrey,
        onPressed: () {
          signUp();
        },
        child: Text(
          S.of(context).sign_up,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget signInButton() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.signIn);
        },
        child: Text(S.of(context).sign_in, style: TextStyle(fontSize: 18)),
      ),
    );
  }

}
