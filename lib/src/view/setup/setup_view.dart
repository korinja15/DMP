import 'package:Talkvee/src/view/setup/setup_auth.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class SetupView extends StatefulWidget {
  @override
  _SetupViewState createState() => _SetupViewState();
}

class _SetupViewState extends State<SetupView> {
  List<Slide> slides = List();

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "Talkvee",
        description:
            'Tato aplikace slouží pro testování dětí a jejich chování při komunikaci na internetu',
        backgroundColor: Color.fromARGB(255, 32, 33, 36),
      ),
    );

    slides.add(
      Slide(
        title: "Administrace",
        description:
            'Pro vstup do administrace podržte prst na nadpisu "Zprávy", dokud nevyskočí nová stránka s nastavením.',
        backgroundColor: Colors.green,
      ),
    );

    slides.add(
      Slide(
        title: "Heslo do administrace",
        description:
            "Po dokončení tutoriálu zadejte PIN, který budete zadávat při vstupu do administrace.",
        backgroundColor: Colors.blue,
      ),
    );
  }

  void onDonePress() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SetupAuth()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlider(
        slides: slides,
        isShowSkipBtn: false,
        onDonePress: onDonePress,
      ),
    );
  }
}
