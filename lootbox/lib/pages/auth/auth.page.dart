import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lootbox_wallet/common/components/custom_page_route.dart';
import 'package:lootbox_wallet/pages/wallet_setup/wallet_setup.page.dart';
import 'package:lootbox_wallet/state/app.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);

    setupWallet() {
      Navigator.of(context).push(
        CustomPageRoute(builder: (_) => WalletSetupPage()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.help_outline_sharp))
        ],
      ),
      body: Stack(
        children: [
          FlareActor("assets/animations/login_screen_animation_top.flr", alignment:Alignment.topCenter, fit:BoxFit.contain, animation:"Flow"),
          Center(
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
                        child: RichText(
                          text:TextSpan(
                            text: '\u{1F44B} Hey There,\nLet\'s Get Started',
                            style: GoogleFonts.firaSans(textStyle: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login to your account to continue',
                          style: GoogleFonts.firaSans(textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                        ),
                      ),
                      Spacer(flex: 3),
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
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                        ),
                        onPressed: () => appState.signInWithGoogle(),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Advanced user? ',
                              style: GoogleFonts.firaSans(textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                              children: [
                                TextSpan(
                                  text: 'Setup a non-custodial wallet',
                                  style: GoogleFonts.nunitoSans(textStyle: TextStyle(
                                    color: Colors.deepPurple,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,
                                  )),
                                  recognizer: TapGestureRecognizer()..onTap = setupWallet,
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
        ],
      ),
    );
  }
}
