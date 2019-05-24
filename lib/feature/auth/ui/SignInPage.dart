import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/routes.dart';
import '../blocs/auth_bloc.dart';
import 'package:flutter_boilerplate/feature/auth/resource/AuthHelper.dart';
import 'dart:developer';
import 'dart:convert';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

 bool isLoading = false;

  TextEditingController textEditControllerEmail = new TextEditingController();
  TextEditingController textEditControllerPassword = new TextEditingController();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  void signIn() {
    if (textEditControllerEmail.text.trim().isEmpty) {
      return;
    }

    if (textEditControllerPassword.text.trim().isEmpty) {
      return;
    }

    setState(() {
      isLoading = true;
    });
    bloc.signIn(textEditControllerEmail.text.trim(),
        textEditControllerPassword.text.trim());

    bloc.signedIn.listen((value) {
      setState(() {
        isLoading = false;
      });
      //debugPrint(data);

      if(!value["error"]) {
        print(value["data"]);
        //AuthHelper.setAccessToken(data["token"]);
        //Navigator.pushReplacementNamed(context, Routes.home);
      }
    });
  }

 @override
 Widget build(BuildContext context) {
   return _buildInputWidget();

    if(isLoading){
      return _buildLoadingWidget();
    }else {
      return _buildInputWidget();
    }

 }


  Widget _buildInputWidget(){
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign In',
              style: Theme.of(context).textTheme.title,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: textEditControllerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: textEditControllerPassword,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                onPressed: () {
                  signIn();
                },
                child: const Text('Sign In', style: TextStyle(fontSize: 20)),
              ),
            ),
//        StreamBuilder<Map<String, dynamic>>(
//          stream: bloc.signedIn,
//          builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
//            if (snapshot.hasData) {
//              _buildSuccessWidget("");
//            } else if (snapshot.hasError) {
//              return _buildErrorWidget(snapshot.error);
//            } else {
//              return SizedBox();
//            }
//          },
//        )
          ],
        ),

      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Please Wait..."), CircularProgressIndicator()],
        ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(error), CircularProgressIndicator()],
        ));
  }

  Widget _buildSuccessWidget(String message) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(message), CircularProgressIndicator()],
        ));
  }

}

