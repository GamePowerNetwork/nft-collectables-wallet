import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lootbox_wallet/common/components/custom_page_route.dart';
import 'package:lootbox_wallet/pages/wallet_setup/phrase.component.dart';
import 'package:lootbox_wallet/pages/wallet_setup/setup_success.dart';
import 'package:lootbox_wallet/state/keyring.dart';
import 'package:lootbox_wallet/state/phrase.dart';
import 'package:provider/provider.dart';

class VerifyPhrasePage extends StatefulWidget {
  VerifyPhrasePage({Key? key}) : super(key: key);

  @override
  _VerifyPhrasePageState createState() => _VerifyPhrasePageState();
}

class _VerifyPhrasePageState extends State<VerifyPhrasePage> {
  late Keyring keyring;
  late PhraseState phraseState;
  bool phraseMatch = false;
  String verificationPhrase = '';

  void _setupSuccessful(BuildContext context) {
    Navigator.of(context).push(
      CustomPageRoute(
          builder: (_) => SetupSeccess()),
    );
  }

  Widget _buildPhraseSelection() {
    if (phraseState.hasError) {
      return Container(
        constraints: BoxConstraints(
          minHeight: 100,
          maxHeight: 290,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Phrase was entered incorrectly. Click retry.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            ElevatedButton(
              child: Text("Retry"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red[900],
                onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 60),
              ),
              onPressed: () {
                phraseState.resetPhrase();
              },
            ),
          ],
        ),
      );
    }

    return Container(
      constraints: BoxConstraints(
        maxHeight: 300,
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Phrase(
            phrase: keyring.phrase,
            scramble: true,
            canSelect: true,
            usePhraseState: true,
          ),
          Spacer(),
          Observer(
            builder: (_) {
              return ElevatedButton(
              child: Text("Continue"),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 60),
              ),
              onPressed: phraseState.isVerified ? () { _setupSuccessful(context); } : null,
            );
            }
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    keyring = Provider.of<Keyring>(context);
    phraseState = Provider.of<PhraseState>(context);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.deepPurple[200],
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            FlareActor("assets/animations/login_screen_animation_top.flr",
              alignment: Alignment.topCenter,
              fit: BoxFit.contain,
              color: Color(0x77000000),
              animation: "Flow"),
            SizedBox(
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    children: [
                    SizedBox(height: 100,),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Verify Phrase",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Tap the words to put them in the correct order as the phrase you saved.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 100,),
                    Container(
                      constraints: BoxConstraints(minHeight: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepPurple,
                      ),
                      child: Phrase(
                        phrase: '',
                        usePhraseState: true,
                        populateList: true,
                      ),
                    ),
                    Observer(
                      builder: (_) {
                        return _buildPhraseSelection();
                      }),
                    SizedBox(height: 40,),
                  ]),
                ),
              ),
          ],
        ));
  }
}
