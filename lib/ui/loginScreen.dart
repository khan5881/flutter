import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/apifunctions/requestLoginAPI.dart';
import '../common/functions/showDialogSingleButton.dart';
import '../common/platform/platformScaffold.dart';
import '../common/widgets/basicDrawer.dart';

import '../common//apifunctions/requestMQTT.dart';

const URL = "server";

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _welcomeString = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      showDialogSingleButton(
          context,
          "Unable to reach your website.",
          "Currently unable to reach the website $URL. Please try again at a later time.",
          "OK");
    }
  }

  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/LoginScreen");
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      controller: _userNameController,
      decoration: InputDecoration(
        labelText: 'Email Address',
        labelStyle: TextStyle(
          fontSize: 15.0,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty||
                  !RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)").hasMatch(value)) {
          return 'Email is required!';
        }
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is required!';
        }
      },
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var drawer = Drawer();
    return WillPopScope(
      onWillPop: () {
        if (Navigator.canPop(context)) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/HomeScreen', (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushReplacementNamed('/HomeScreen');
        }
      },
      child: PlatformScaffold(
        drawer: BasicDrawer(),
        appBar: AppBar(
          title: Text(
            "LOGIN",
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: ListView(children: <Widget>[
                _buildEmailTextField(),
                SizedBox(
                  height: 10.0,
                ),
                _buildPasswordTextField(),
                SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    elevation: 4.0,
                    splashColor: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      requestLoginAPI(context, _userNameController.text,
                          _passwordController.text);
                    },

                    // onPressed: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Notification()),
                      //   );
                      
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: FlatButton(
                    child: Text(
                      'Click here to Register',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/Register');
                    },
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
