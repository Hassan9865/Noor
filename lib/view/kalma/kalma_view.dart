import 'package:flutter/material.dart';
import 'package:noor/view/kalma/kalma_viewModel.dart';
import 'package:stacked/stacked.dart';

class KalmaView extends StatelessWidget {
  const KalmaView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => KalmaViewmodel(),
      builder: (context, KalmaViewmodel viewModel, child) {
        return Scaffold();
      },
    );
  }
}
