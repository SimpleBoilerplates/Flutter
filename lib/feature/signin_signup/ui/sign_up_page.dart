import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/feature/authentication/bloc/index.dart';
import 'package:flutter_boilerplate/feature/signin_signup/bloc/index.dart';
import 'package:flutter_boilerplate/feature/signin_signup/resources/index.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';

import 'signup_form.dart';

class SignUpPage extends StatelessWidget {
  final AuthRepository authRepository;

  SignUpPage({Key key, @required this.authRepository})
      : assert(authRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).sign_in),
      ),
      body: BlocProvider(
        create: (context) {
          return SignInBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            authRepository: authRepository,
          );
        },
        child: SignUpForm(),
      ),
    );
  }
}

/*
class SignUpPage extends StatefulWidget {
  final AuthRepository authRepository;

  SignUpPage({Key key, @required this.authRepository})
      : assert(authRepository != null),
        super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    //_bloc = AuthBloc();
    _listen();
  }

  @override
  void dispose() {
    //_bloc.dispose();
    super.dispose();
  }

  void signUp() {
    //_bloc.signUp();
  }

  void _listen() {
//    _bloc.signedUp.listen((DataState value) {
//      if (value is StateSuccessWithMap) {
//        Navigator.pop(context);
//      }
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        //title: new Text("Title"),
      ),
      body: StreamBuilder(
        //stream: _bloc.signedUp,
        initialData: StateInitial(),
        builder: (BuildContext context, AsyncSnapshot<DataState> snapshot) {
          return buildBody(snapshot);
        },
      ),
    );
  }

  Widget buildBody(AsyncSnapshot<DataState> snapshot) {
    final state = snapshot.data;

    return Stack(
      children: <Widget>[
        _formWidget(state is StateInitial),
        LoadingWidget(visible: state is StateLoading),
        WidgetError(visible: state is StateError),
      ],
    );
  }

  Widget _formWidget(bool visible) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).sign_up,
              style: Theme.of(context).textTheme.title,
            ),
            const SizedBox(height: 30),
            _nameField(),
            const SizedBox(height: 10),
            _emailField(),
            const SizedBox(height: 10),
            _passwordField(),
            const SizedBox(height: 25),
            _signUpButton(),
            const SizedBox(height: 10),
            _signInButton()
          ],
        ),
      ),
    );
  }

  Widget _nameField() {
    return StreamBuilder(
        //stream: _bloc.name,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      return TextField(
        // onChanged: _bloc.changeName,
        decoration: InputDecoration(
            hintText: S.of(context).name_hint, errorText: snapshot.error),
      );
    });
  }

  Widget _passwordField() {
    return StreamBuilder(
        //stream: _bloc.password,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      return TextField(
        //onChanged: _bloc.changePassword,
        obscureText: true,
        decoration: InputDecoration(
            hintText: S.of(context).password_hint, errorText: snapshot.error),
      );
    });
  }

  Widget _emailField() {
    return StreamBuilder(
        //stream: _bloc.email,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      return TextField(
        //onChanged: _bloc.changeEmail,
        decoration: InputDecoration(
            hintText: S.of(context).email_hint, errorText: snapshot.error),
      );
    });
  }

  Widget _signUpButton() {
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

  Widget _signInButton() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.signIn);
        },
        child:
            Text(S.of(context).sign_in, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
*/
