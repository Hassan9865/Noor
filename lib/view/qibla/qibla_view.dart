import 'package:flutter/material.dart';
import 'package:noor/view/qibla/qibla_viewModel.dart';
import 'package:stacked/stacked.dart';

class QiblaView extends StatelessWidget {
  const QiblaView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => QiblaViewmodel(),
      builder: (context, QiblaViewmodel viewModel, child) {
        return Scaffold();
      },
    );
  }
}
