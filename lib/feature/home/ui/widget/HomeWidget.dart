import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/base/data_state.dart';
import 'package:flutter_boilerplate/feature/home/ui/widget/BooksWidget.dart';

import '../../../../common/constant/routes.dart';
import '../../../../common/widget/empty_widget.dart';
import '../../../../common/widget/loading_widget.dart';
import '../../../../common/widget/widget_error.dart';
import '../../blocs/home_bloc.dart';
import '../../blocs/home_bloc_provider.dart';
import '../widget/BooksWidget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = HomeBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc.fetchAllBooks();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Books'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.adjust),
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.signIn);
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _bloc.books,
        initialData: StateEmpty(),
        builder: (BuildContext context, AsyncSnapshot<DataState> snapshot) {
          return buildBody(snapshot);
        },
      ),
    );
  }

  Widget buildBody(AsyncSnapshot<DataState> snapshot) {
    final DataState state = snapshot.data;

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
