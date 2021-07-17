import 'package:flutter/material.dart';
import 'package:lootbox_wallet/common/components/custom_page_route.dart';
import 'package:lootbox_wallet/pages/wallet_setup/recovery_phrase.page.dart';
import 'package:lottie/lottie.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletSetupPage extends StatefulWidget {
  WalletSetupPage({Key? key}) : super(key: key);

  @override
  _WalletSetupPageState createState() => _WalletSetupPageState();
}

class _WalletSetupPageState extends State<WalletSetupPage> {
  bool agreeToSetup = false;

  void _continue() {
    Navigator.of(context).push(
      CustomPageRoute(builder: (_) => RecoveryPhrasePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            FlareActor("assets/animations/login_screen_animation_top.flr", alignment:Alignment.topCenter, fit:BoxFit.contain, animation:"Flow"),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Secure and Private",
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "With 'advanced user' mode, your crypto keys will never leave this device. However, be aware that if you lose your recovery phrase, there will be no way to recover your wallet.",
                      style: GoogleFonts.nunitoSans(textStyle: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.3),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Prepare for backup!",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    Text(
                      "On the next screen you will be provided 12 words used to recover your wallet if lost.",
                      textAlign: TextAlign.center,
                    ),
                    Spacer(flex: 4),
                    Lottie.asset('assets/animations/warning.json'),
                    Row(
                      children: [
                        Checkbox(
                          value: agreeToSetup, 
                          onChanged: (bool? value) {
                            setState(() {
                              agreeToSetup = value!;
                            });
                          }
                        ),
                        Expanded(
                          child: Text(
                            "I unserstand that if I lose my recovery phrase, I will not be able to access my collectibles.",
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8,),
                    ElevatedButton( 
                      child: Text("Continue"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple[600],
                        onPrimary: Colors.white,
                        minimumSize: Size(double.infinity, 60),
                      ),
                      onPressed: agreeToSetup ? _continue : null,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
