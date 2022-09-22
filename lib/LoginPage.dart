import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import './HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    String userNameText = '';

    Widget formField({String? fieldText, String? regex}) {
      final String _fieldText = fieldText!;
      final String _regex = regex!;


      return Column(children: [
        SizedBox(height: _height * 0.05),
        TextFormField(
          decoration: InputDecoration(
            labelText: _fieldText,
          ),
          validator: (value) {
            if (value!.isEmpty || !RegExp(_regex).hasMatch(value)) {
              return "Invalid $_fieldText";
            }
            return null;
          },
          onChanged: (str){
            if(fieldText == 'Username') {
              userNameText = str;
            }
          },
        ),
      ]);
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.amber,
      body: Container(
        padding: const EdgeInsets.all(25),
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: _height * 0.04),
              formField(fieldText: "Username", regex: r'^[a-z A-Z]+$'),
              formField(
                  fieldText: "Email Address",
                  regex: r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,5}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Sign Up"),
                  OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  HomePage(userName: userNameText))
                        );
                        }
                      },
                      child: const Text("Authorize")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}