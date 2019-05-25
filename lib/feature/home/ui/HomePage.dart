import 'package:flutter/material.dart';
import '../blocs/HomeBlocs.dart';
import '../model/Book.dart';
import '../ui/BookCell.dart';
import 'package:flutter_boilerplate/shared/routes.dart';
import 'package:flutter_boilerplate/feature/auth/resource/AuthHelper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllBooks();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        //title: new Text("Title"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.cancel),
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
        stream: bloc.allBooks,
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
              child: new BookCell(snapshot.data, index),
              // onTap: () => openDetailPage(snapshot.data, index),
            ),
          );
        });
  }

//  openDetailPage(ItemModel data, int index) {
//    final page = MovieDetailBlocProvider(
//      child: MovieDetail(
//        title: data.results[index].title,
//        posterUrl: data.results[index].backdrop_path,
//        description: data.results[index].overview,
//        releaseDate: data.results[index].release_date,
//        voteAverage: data.results[index].vote_average.toString(),
//        movieId: data.results[index].id,
//      ),
//    );
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) {
//        return page;
//      }),
//    );
//  }
}
