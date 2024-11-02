// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:furevr/view_model/services_vm/grooming_vm.dart';
import 'package:furevr/widget/custom_appbar_widget.dart';
import 'package:furevr/widget/grooming_card_widget.dart';
import 'package:provider/provider.dart';

class GroomingView extends StatefulWidget {
  const GroomingView({super.key});

  @override
  State<GroomingView> createState() => _GroomingViewState();
}

class _GroomingViewState extends State<GroomingView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GroomingServiceViewModel()..getGroomingServices(),
      child: Scaffold(
        appBar: CustomAppBar(title: "Grooming"),
        body: Consumer<GroomingServiceViewModel>(
          builder: (context, viewModel, child) {
            final groomingServices = viewModel.groomingServiceModel;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: const [],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Wrap(
                      children: List.generate(
                        groomingServices.length,
                        (index) => Padding(
                          padding: EdgeInsets.all(4.0),
                          child: GroomingCardWidget(
                            imgScr: groomingServices[index].image?.first,
                            fromDistance: "3.6",
                            title: groomingServices[index].branch != null &&
                                    groomingServices[index].branch != null
                                ? "${groomingServices[index].branch} - ${groomingServices[index].brand}"
                                : null,
                            location: "Valencia, Spain",
                            average: "800",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
