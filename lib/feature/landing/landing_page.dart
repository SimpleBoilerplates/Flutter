import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/route/routes.dart';
import 'package:flutter_boilerplate/common/widget/loading_widget.dart';
import 'package:flutter_boilerplate/feature/authentication/blocs/blocs.dart';
import 'package:flutter_boilerplate/feature/landing/splash_page.dart';
import 'package:flutter_boilerplate/feature/signin_signup/resources/auth_repository.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
      // do stuff here based on BlocA's state
      if (state is AuthenticationAuthenticated) {
        Navigator.pushReplacementNamed(context, Routes.landing);
      }
      if (state is AuthenticationUnauthenticated) {
        Navigator.pushReplacementNamed(context, Routes.signIn,
            arguments: AuthRepository());
      }
    }, builder: (context, state) {
      // return widget here based on BlocA's state
      if (state is AuthenticationLoading) {
        return const LoadingWidget();
      }
      return SplashPage();
    });
  }
}
