import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../common/apifunctions/requestLoginAPI.dart';
import '../common/functions/showDialogSingleButton.dart';
import '../common/platform/platformScaffold.dart';
import '../common/widgets/basicDrawer.dart';

const URL = "http://www.google.com";

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterStateState();
  }
}

class _RegisterStateState extends State<RegisterScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _espid1Controller = TextEditingController();
  final TextEditingController _espid2Controller = TextEditingController();
  bool _acceptTerms = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)")
                .hasMatch(value)) {
          return 'Email is required!';
        }
      },
      autovalidate: true,
      decoration: InputDecoration(
        labelText: 'Email Address',
      ),
      controller: _userNameController,
    );
  }

  Widget _buildFirstNameTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'First Name is required!';
        }
      },
      decoration: InputDecoration(
        labelText: 'First Name',
      ),
      controller: _firstNameController,
    );
  }

  Widget _buildLastNameTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Last Name is required!';
        }
      },
      decoration: InputDecoration(
        labelText: 'Last Name',
      ),
      controller: _lastNameController,
    );
  }

  Widget _buildESPTextField() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            validator: (String value) {
              if (value.isEmpty ||
                  !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
                return 'ESP should be a number!';
              }
            },
            decoration: InputDecoration(
              labelText: 'ESP code1',
            ),
            controller: _espid1Controller,
          ),
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            validator: (String value) {
              if (value.isEmpty ||
                  !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
                return 'ESP should be a number!';
              }
            },
            decoration: InputDecoration(
              labelText: 'ESP code2',
            ),
            controller: _espid2Controller,
          ),
        ),
      ],
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
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      controller: _passwordController,
    );
  }

  Widget _buildAcceptTermsSwitch() {
    return SwitchListTile(
      title: Text('Accept the terms and conditions'),
      value: _acceptTerms,
      onChanged: (bool value) {
        _acceptTerms = value;
      },
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
            "Register",
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
                _buildFirstNameTextField(),
                _buildLastNameTextField(),
                _buildESPTextField(),
                _buildPasswordTextField(),
                SizedBox(
                  height: 30.0,
                ),
                _buildAcceptTermsSwitch(),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    elevation: 4.0,
                    splashColor: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      if (_acceptTerms)
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                      requestRegisterAPI(
                          context,
                          _userNameController.text,
                          _passwordController.text,
                          _firstNameController.text,
                          _lastNameController.text,
                          _espid1Controller.text,
                          _espid2Controller.text);
                      Navigator.pushReplacementNamed(context, "/LoginScreen");
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
