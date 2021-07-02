import 'package:flutter/material.dart';
import 'package:lootbox_wallet/state/app.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletSetup extends StatefulWidget {
  WalletSetup({Key? key}) : super(key: key);

  @override
  _WalletSetupState createState() => _WalletSetupState();
}

class _WalletSetupState extends State<WalletSetup> {
  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("Sign In"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.help_outline_sharp))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hey There,\nLet\'s Get Started',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login to your account to continue',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      minimumSize: Size(double.infinity, 60),
                    ),
                    label: Text("Sign In With Apple"),
                    icon: FaIcon(FontAwesomeIcons.apple),
                    onPressed: () => appState.signInWithApple(),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      minimumSize: Size(double.infinity, 60),
                    ),
                    label: Text("Sign In With Google"),
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.red,),
                    onPressed: () => appState.signInWithGoogle(),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(text: 'Advanced user? ', children: [
                    TextSpan(
                      text: 'Setup a non-custodial wallet',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ])),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
