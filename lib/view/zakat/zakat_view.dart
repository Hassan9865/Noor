import 'package:flutter/material.dart';
import 'package:noor/view/zakat/zakat_viewModel.dart';
import 'package:stacked/stacked.dart';

class ZakatView extends StatelessWidget {
  const ZakatView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ZakatViewmodel(),
      builder: (context, ZakatViewmodel viewModel, child) {
        return Scaffold();
      },
    );
  }
}
