import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/ui/widget/BooksWidget.dart';
import 'package:flutter_boilerplate/shared/base/DataState.dart';

import '../../../../main/bloc/GlobalBloc.dart';
import '../../../../main/bloc/GlobalBlocProvider.dart';
import '../../../../shared/constant/Routes.dart';
import '../../../../shared/widget/EmptyWidget.dart';
import '../../../../shared/widget/LoadingWidget.dart';
import '../../../../shared/widget/WidgetError.dart';
import '../../blocs/HomeBloc.dart';
import '../../blocs/HomeBlocProvider.dart';
import '../widget/BooksWidget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeBloc _bloc;
  GlobalBloc _globalBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = HomeBlocProvider.of(context);
    _globalBloc = GlobalBlocProvider.of(context);
  }

  @override
  void dispose() {
    _globalBloc.dispose();
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc.fetchAllBooks();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        //title: new Text("Title"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.adjust),
            onPressed: () {
              _globalBloc.logout();
              Navigator.pushReplacementNamed(context, Routes.signIn);
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _bloc.books,
        initialData: StateEmpty(),
        builder: (context, AsyncSnapshot<DataState> snapshot) {
          return buildBody(snapshot);
        },
      ),
    );
  }

  Widget buildBody(AsyncSnapshot<DataState> snapshot) {
    final state = snapshot.data;

    return Stack(
      children: <Widget>[
        EmptyWidget(visible: state is StateEmpty),
        LoadingWidget(visible: state is StateLoading),
        WidgetError(visible: state is StateError),
        BooksWidget(items: state is StateSuccessWithList ? state.result : [])
      ],
    );
  }
}
