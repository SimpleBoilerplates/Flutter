import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/auth/model/auth_state.dart';
import 'package:flutter_boilerplate/feature/auth/provider/auth_provider.dart';
import 'package:flutter_boilerplate/l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authProvider, (previous, next) {
      if (next is AuthState) {
        next.maybeWhen(
          loggedIn: () {
            context.router.popUntilRoot();
          },
          orElse: () {
            {}
          },
        );
      }
    });

    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: <Widget>[
              const SizedBox(height: 150),
              Text(
                context.l10n.sign_up,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: context.l10n.name_hint,
                      ),
                      controller: _nameController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: context.l10n.email_hint,
                      ),
                      controller: _emailController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: context.l10n.password_hint,
                      ),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const SizedBox(height: 30),
                          _widgetSignUpButton(context, ref),
                          const SizedBox(height: 30),
                          Text(
                            context.l10n.already_user,
                            textAlign: TextAlign.center,
                          ),
                          _widgetSignInButton(context, ref),
                        ]),
                  ],
                ),
              )
            ])));
  }

  Widget _widgetSignInButton(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            context.router.pop();
          },
          child: Text(context.l10n.sign_in),
        ));
  }

  Widget _widgetSignUpButton(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            ref.read(authProvider.notifier).signUp(_nameController.text,
                _emailController.text, _passwordController.text);
          },
          child: Text(context.l10n.sign_up),
        ));
  }
}
