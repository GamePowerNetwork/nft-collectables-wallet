import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lootbox_wallet/state/app.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late AppState appState;
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    appState.completeOnboarding();
    /*
    Navigator.of(context).push(
      CustomPageRoute(builder: (_) => TabView()),
    );
    */
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);

    const bodyStyle = TextStyle(fontSize: 19.0, color: Colors.black);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.black),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('LootBox.png', 100),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 90,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurple,
            onPrimary: Colors.black,
            minimumSize: Size(double.infinity, 60),
          ),
          child: const Text(
            'Skip Intro',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Digital Collectibles Made Easy",
          body: "Placeholder text.",
          image: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Lottie.asset('assets/animations/treasure.json'),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Buy, Sell and Trade",
          body: "Placeholder text.",
          image: Icon(
            Icons.shopping_basket_rounded,
            size: 200,
            color: Colors.deepOrange[500],
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Discover Rare Collectibles",
          body: "Placeholder text.",
          image: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Lottie.asset('assets/animations/gaming-community.json'),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Collectibles in the Real World",
          body:
              "View your collectibles in augmented reality. Take your rare finds everywhere you go",
          image: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Lottie.asset('assets/animations/virtual-reality.json'),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Start Collecting!",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on ", style: bodyStyle),
              Icon(
                Icons.stars,
                color: Colors.deepOrange,
              ),
              Text(" to view loot drops!", style: bodyStyle),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: Lottie.asset('assets/animations/blue-diamond.json'),
          reverse: true,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text(
        'Skip',
        style: TextStyle(color: Colors.white),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      done: const Text('Done',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.white,
        activeColor: Colors.deepPurple,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black45,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
