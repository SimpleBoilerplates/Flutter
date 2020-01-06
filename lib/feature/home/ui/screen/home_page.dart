import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/route/routes.dart';
import 'package:flutter_boilerplate/feature/authentication/bloc/index.dart';
import 'package:flutter_boilerplate/feature/home/bloc/index.dart';
import 'package:flutter_boilerplate/feature/home/resource/home_repository.dart';
import 'package:flutter_boilerplate/feature/home/ui/widget/home_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Books'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.adjust),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                Navigator.pushReplacementNamed(context, Routes.landing);
              },
            ),
          ],
        ),
        body: BlocProvider(
            create: (context) =>
                BooksBloc(homeRepository: HomeRepository())..add(Fetch()),
            child: Container(child: const HomeWidget())));
  }
}
