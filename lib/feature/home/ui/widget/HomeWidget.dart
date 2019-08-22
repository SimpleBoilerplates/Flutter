import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/auth/resource/AuthHelper.dart';
import 'package:flutter_boilerplate/shared/constant/Routes.dart';

import '../../blocs/HomeBloc.dart';
import '../../blocs/HomeBlocProvider.dart';
import '../../model/Book.dart';
import '../BookCell.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

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
        //title: new Text("Title"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              AuthHelper.logout().then((onValue) {
                if (onValue) {
                  Navigator.pushReplacementNamed(context, Routes.signIn);
                }
              });
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _bloc.allBooks,
        builder: (context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<Book>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            child: InkResponse(
              enableFeedback: true,
              child: BookCell(snapshot.data, index),
              // onTap: () => openDetailPage(snapshot.data, index),
            ),
          );
        });
  }
}
