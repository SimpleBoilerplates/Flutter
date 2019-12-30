import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/widget/loading_widget.dart';
import 'package:flutter_boilerplate/feature/authontication/blocs/blocs.dart';
import 'package:flutter_boilerplate/feature/home/ui/screen/home_screen.dart';
import 'package:flutter_boilerplate/feature/landing/splash_page.dart';
import 'package:flutter_boilerplate/feature/signin_signup/resources/auth_repository.dart';
import 'package:flutter_boilerplate/feature/signin_signup/ui/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          return HomeScreen();
        }
        if (state is AuthenticationUnauthenticated) {
          return SignInPage(authRepository: AuthRepository());
        }
        if (state is AuthenticationLoading) {
          return const LoadingWidget();
        }
        return SplashPage();
      },
    );
  }
}
