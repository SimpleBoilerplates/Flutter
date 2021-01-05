import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/feature/signin_signup/bloc/index.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  void _onSignUpButtonPressed() {
    BlocProvider.of<SignUpBloc>(context).add(
      SignUpButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
        email: _emailController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Theme.of(context).errorColor,
            ),
          );
        }

        if (state is SignUpSuccess) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).signup_success),
              backgroundColor: Theme.of(context).accentColor,
            ),
          );

          Navigator.pop(context);
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 150),
                    Text(S.of(context).sign_up,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 40)),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                              decoration: InputDecoration(
                                  labelText: S.of(context).email_hint),
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: S.of(context).user_name_hint),
                            controller: _usernameController,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: S.of(context).password_hint),
                            controller: _passwordController,
                            obscureText: true,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                const SizedBox(height: 30),
                                _signUpButton(state),
                                const SizedBox(height: 30),
                                Text(
                                  S.of(context).already_user,
                                  textAlign: TextAlign.center,
                                ),
                                _signInButton(),
                              ]),
                          Container(
                            child: state is SignInLoading
                                ? const CircularProgressIndicator()
                                : null,
                          ),
                        ],
                      ),
                    )
                  ]));
        },
      ),
    );
  }

  Widget _signInButton() {
    return SizedBox(
        width: double.infinity,
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(S.of(context).sign_in),
        ));
  }

  Widget _signUpButton(SignInState state) {
    return SizedBox(
        width: double.infinity,
        child: RaisedButton(
          color: Colors.white,
          onPressed: state is! SignInLoading ? _onSignUpButtonPressed : null,
          child: Text(S.of(context).sign_up),
        ));
  }
}
