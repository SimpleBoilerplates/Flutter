import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/Routes.dart';
import 'package:flutter_boilerplate/shared/widget/ConditionalContent.dart';
import '../blocs/AuthBloc.dart';
import 'package:flutter_boilerplate/feature/auth/resource/AuthHelper.dart';
import 'package:flutter_boilerplate/shared/helper/FormValidator.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isLoading = false;

  TextEditingController textEditControllerEmail = new TextEditingController();
  TextEditingController textEditControllerPassword =
      new TextEditingController();

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

      if (!value["error"]) {
        print(value["data"]);
        AuthHelper.setAccessToken(value["token"]);
        Navigator.pushReplacementNamed(context, Routes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _formUI();

//    return ConditionalContent(
//      conditional: isLoading,
//      truthyBuilder: () {
//         return _buildLoadingWidget;
//      },
//      falsyBuilder: () {
//        return  _formUI();
//      },
//    );
  }

  Widget _formUI() {
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
            TextFormField(
              controller: textEditControllerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
              validator: FormValidator.validateEmail,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: textEditControllerPassword,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password', hintText: 'Enter your password'),
              validator: FormValidator.validatePassword,
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                color: Colors.blueGrey,
                onPressed: () {
                  signIn();
                },
                child: const Text('Sign In',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.signUp);
                },
                child: const Text('Sign Up', style: TextStyle(fontSize: 18)),
              ),
            ),
            StreamBuilder<Map<String, dynamic>>(
              stream: bloc.signedIn,
              builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.hasData) {
                  _buildSuccessWidget("");
                } else if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.error);
                } else {
                  return const SizedBox(height: 0);
                }
                //return Center(child: CircularProgressIndicator());
              },
            )
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
