// Define a custom Form widget.
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class LoginScreenState extends State<LoginScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  FocusNode focusPassword;

  @override
  void initState() {
    super.initState();
    focusPassword = FocusNode();
  }

  @override
  void dispose() {
    focusPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      // Build a Form widget using the _formKey created above.
      Scaffold(
        appBar: AppBar(title: Text('Student Job Board')),
        body: Center(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.go,
                            onFieldSubmitted: (String data) {
                              focusPassword.requestFocus();
                            },
                            decoration: InputDecoration(
                                labelText: 'Enter your email'),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            focusNode: focusPassword,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Enter your password'),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          RaisedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, otherwise false.
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                // Scaffold.of(context).showSnackBar(
                                //     SnackBar(content: Text('Processing Data')));
                                Navigator.of(context)
                                    .pushReplacementNamed('/home');
                              }
                            },
                            child: Text('Login'),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/onboarding');
                            },
                            child: Text('Register'),
                          ),
                          // Add TextFormFields and RaisedButton here.
                        ])))),
      );
}
