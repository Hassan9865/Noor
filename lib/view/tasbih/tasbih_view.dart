import 'package:flutter/material.dart';
import 'package:noor/view/tasbih/tasbih_viewModel.dart';
import 'package:stacked/stacked.dart';

class TasbihView extends StatelessWidget {
  const TasbihView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TasbihViewmodel(),
      builder: (context, TasbihViewmodel viewModel, child) {
        return Scaffold();
      },
    );
  }
}
