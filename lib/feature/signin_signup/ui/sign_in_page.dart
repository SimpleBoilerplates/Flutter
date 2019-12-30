import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/feature/authontication/blocs/authentication_bloc.dart';
import 'package:flutter_boilerplate/feature/signin_signup/blocs/blocs.dart';
import 'package:flutter_boilerplate/feature/signin_signup/resources/auth_repository.dart';
import 'package:flutter_boilerplate/feature/signin_signup/ui/signin_form.dart';

class SignInPage extends StatelessWidget {
  final AuthRepository authRepository;

  SignInPage({Key key, @required this.authRepository})
      : assert(authRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        create: (context) {
          return SignInBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            authRepository: authRepository,
          );
        },
        child: SignInForm(),
      ),
    );
  }
}

//class _SignInPageState extends State<SignInPage> {
//  AuthBloc _bloc;
//
//  @override
//  void initState() {
//    super.initState();
//    _bloc = AuthBloc();
//    _listen();
//  }
//
//  @override
//  void dispose() {
//    _bloc.dispose();
//    super.dispose();
//  }
//
//  void _listen() {
//    _bloc.signedIn.listen((DataState value) {
//      print(value);
//      if (value is StateSuccessWithMap) {
//        Navigator.pushReplacementNamed(context, Routes.home);
//      }
//    });
//  }
//
//  void signIn() {
//    _bloc.signIn();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.blueGrey,
//      ),
//      body: StreamBuilder(
//        stream: _bloc.signedIn,
//        initialData: StateInitial(),
//        builder: (BuildContext context, AsyncSnapshot<DataState> snapshot) {
//          return buildBody(snapshot);
//        },
//      ),
//    );
//  }
//
//  Widget buildBody(AsyncSnapshot<DataState> snapshot) {
//    final state = snapshot.data;
//
//    return Stack(
//      children: <Widget>[
//        _formWidget(state is StateInitial),
//        LoadingWidget(visible: state is StateLoading),
//        WidgetError(visible: state is StateError),
//      ],
//    );
//  }
//
//  Widget _formWidget(bool visible) {
//    return AnimatedOpacity(
//      duration: const Duration(milliseconds: 300),
//      opacity: visible ? 1.0 : 0.0,
//      child: Container(
//        margin: const EdgeInsets.all(16),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              S.of(context).sign_in,
//              style: Theme.of(context).textTheme.title,
//            ),
//            const SizedBox(height: 10),
//            _emailField(),
//            const SizedBox(height: 10),
//            _passwordField(),
//            const SizedBox(height: 25),
//            _signInButton(),
//            const SizedBox(height: 10),
//            _signUpButton(),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget _passwordField() {
//    return StreamBuilder(
//        stream: _bloc.password,
//        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//          return TextField(
//            onChanged: _bloc.changePassword,
//            obscureText: true,
//            decoration: InputDecoration(
//                hintText: S.of(context).passwordHint,
//                errorText: snapshot.error),
//          );
//        });
//  }
//
//  Widget _emailField() {
//    return StreamBuilder(
//        stream: _bloc.email,
//        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//          return TextField(
//            onChanged: _bloc.changeEmail,
//            decoration: InputDecoration(
//                hintText: S.of(context).emailHint, errorText: snapshot.error),
//          );
//        });
//  }
//
//  Widget _signInButton() {
//    return SizedBox(
//      width: double.infinity,
//      height: 45,
//      child: RaisedButton(
//        color: Colors.white,
//        onPressed: () {
//          signIn();
//        },
//        child:
//            Text(S.of(context).sign_in, style: const TextStyle(fontSize: 18)),
//      ),
//    );
//  }
//
//  Widget _signUpButton() {
//    return SizedBox(
//      width: double.infinity,
//      height: 45,
//      child: FlatButton(
//        onPressed: () {
//          Navigator.pushReplacementNamed(context, Routes.signUp);
//        },
//        child: Text(
//          S.of(context).sign_up,
//          style: TextStyle(fontSize: 18, color: Colors.blueGrey),
//        ),
//      ),
//    );
//  }
//}
