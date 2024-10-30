// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:furevr/widget/custom_appbar_widget.dart';
import 'package:furevr/widget/grooming_card_widget.dart';

class GroomingView extends StatefulWidget {
  const GroomingView({super.key});

  @override
  State<GroomingView> createState() => _GroomingViewState();
}

class _GroomingViewState extends State<GroomingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Grooming"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: const [],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.all(4.0),
                    child: GroomingCardWidget(
                      imgScr: "assets/images/card_dog_1.png",
                      fromDistance: "3.6",
                      title: "Heads Up For Tails",
                      location: "Valencia, Spain",
                      average: "800",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
