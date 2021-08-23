import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lootbox_wallet/common/components/custom_page_route.dart';
import 'package:lootbox_wallet/pages/wallet_setup/phrase.component.dart';
import 'package:lootbox_wallet/pages/wallet_setup/verify_phrase.page.dart';
import 'package:lootbox_wallet/state/keyring.dart';
import 'package:lootbox_wallet/state/phrase.dart';
import 'package:provider/provider.dart';
import 'package:clipboard/clipboard.dart';

class RecoveryPhrasePage extends StatefulWidget {
  RecoveryPhrasePage({Key? key}) : super(key: key);

  @override
  _RecoveryPhrasePageState createState() => _RecoveryPhrasePageState();
}

class _RecoveryPhrasePageState extends State<RecoveryPhrasePage> {
  late Keyring keyring;
  late List<String> phrases;

  @override
  void initState() {
    super.initState();
    () async {
      await Future.delayed(Duration.zero);
    }();
  }

  void copyPhrase() {
    FlutterClipboard.copy(keyring.phrase).then((value) => print('copied'));
  }

  void verifyPhrase(BuildContext context) {
    Navigator.of(context).push(
      CustomPageRoute(
          builder: (_) => Provider(
              create: (_) => PhraseState(keyring.phrase),
              child: VerifyPhrasePage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    keyring = Provider.of<Keyring>(context);
    keyring.requestPhrase();

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
            height: size.height * 0.7,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Spacer(flex: 2),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Recovery Phrase",
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
                      "Write down or copy these words in the right order and save them somewhere safe.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Spacer(flex: 2),
                  Observer(
                    builder: (_) {
                      return Phrase(
                        phrase: keyring.phrase,
                      );
                    },
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Copy phrase",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = copyPhrase,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Do not share this phrase with anyone or take a screenshot of it. Write it down and store it somewhere safe.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  ElevatedButton(
                    child: Text("Continue"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple[600],
                      onPrimary: Colors.white,
                      minimumSize: Size(double.infinity, 60),
                    ),
                    onPressed: () {
                      verifyPhrase(context);
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
